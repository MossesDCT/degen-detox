import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:bs58/bs58.dart';
import 'package:cryptography/cryptography.dart' as crypto;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:solana_mobile_client/solana_mobile_client.dart';
import 'domain.dart';
import 'wallet_handoff.dart';

const qaBuild = bool.fromEnvironment('DEGEN_QA');
// Not enabled in public production builds. Owner explicitly requested a local
// reset to test a second, real SKR purchase without changing anyone else's license.
const ownerTestTools = bool.fromEnvironment('DEGEN_OWNER_TEST_TOOLS');
const merchant = '6vqJTwDWoNXauztA3e8psbnrm4bNWFDAG218NbAMPgaG';
const skrMint = 'SKRbvo6Gf7GondiT3BbTfuRDPqLWei4j2Qy2NPGZhW3';
const tokenProgram = 'TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA';
const memoProgram = 'MemoSq4gqABAXKb96qnH8TysNcWxMyWCqXgDLGmfcHr';
const solPrice = 100000000;
const skrPrice = 500000000;
const rpcEndpoint = String.fromEnvironment('SOLANA_RPC',
    defaultValue: 'https://api.mainnet-beta.solana.com');
const mainnetGenesis = '5eykt4UsFv8P8NJdTREpY1vzqKqZKvdpKuc147dw2N9d';

class PaymentFailure implements Exception {
  const PaymentFailure(this.code);
  final String code;
  @override
  String toString() => code;
}

class PurchaseReceipt {
  const PurchaseReceipt(this.wallet, this.signature, this.tier);
  final String wallet, signature;
  final AccessTier tier;
  Map<String, dynamic> toJson() => {
        'wallet': wallet,
        'signature': signature,
        'tier': tier.name,
        'network': 'mainnet-beta'
      };
  static PurchaseReceipt? fromJson(Map<String, dynamic> v) {
    if (v['network'] != 'mainnet-beta' || !['sol', 'skr'].contains(v['tier'])) {
      return null;
    }
    return PurchaseReceipt(v['wallet'] as String, v['signature'] as String,
        v['tier'] == 'skr' ? AccessTier.skr : AccessTier.sol);
  }
}

/// Pure verifier for finalized jsonParsed RPC transaction data.
/// Only exact-price, app-tagged transfers from the authenticated wallet count.
AccessTier verifyPayment(Map<String, dynamic> tx, String wallet,
    String signature, String recipientAta) {
  try {
    if (wallet == merchant || tx['meta'] == null || tx['meta']['err'] != null) {
      return AccessTier.free;
    }
    final transaction = tx['transaction'] as Map;
    final signatures = transaction['signatures'] as List;
    if (signatures.first != signature) return AccessTier.free;
    final message = transaction['message'] as Map;
    final keys = (message['accountKeys'] as List).cast<Map>();
    if (keys.first['pubkey'] != wallet || keys.first['signer'] != true) {
      return AccessTier.free;
    }
    final instructions = (message['instructions'] as List).cast<Map>();
    final memos = instructions.where((i) => i['programId'] == memoProgram);
    if (memos.length != 1) return AccessTier.free;
    final memo = memos.single['parsed'];
    if (memo is! String) return AccessTier.free;
    final parts = memo.split('|');
    if (parts.length != 5 ||
        parts[0] != 'DD1' ||
        parts[1] != 'lifetime' ||
        parts[3] != wallet ||
        !RegExp(r'^[0-9a-f]{32}$').hasMatch(parts[4])) {
      return AccessTier.free;
    }
    if (parts[2] == 'SOL') {
      final valid = instructions.where((i) =>
          i['programId'] == '11111111111111111111111111111111' &&
          i['parsed'] is Map &&
          i['parsed']['type'] == 'transfer' &&
          i['parsed']['info']['source'] == wallet &&
          i['parsed']['info']['destination'] == merchant &&
          i['parsed']['info']['lamports'] == solPrice);
      final index = keys.toList().indexWhere((k) => k['pubkey'] == merchant);
      if (valid.length == 1 &&
          index >= 0 &&
          (tx['meta']['postBalances'][index] as num) -
                  (tx['meta']['preBalances'][index] as num) >=
              solPrice) {
        return AccessTier.sol;
      }
    }
    if (parts[2] == 'SKR') {
      final valid = instructions.where((i) {
        if (i['programId'] != tokenProgram || i['parsed'] is! Map) return false;
        final p = i['parsed'] as Map;
        final info = p['info'] as Map?;
        return p['type'] == 'transferChecked' &&
            info != null &&
            info['authority'] == wallet &&
            info['mint'] == skrMint &&
            info['destination'] == recipientAta &&
            info['tokenAmount']['amount'] == '$skrPrice' &&
            info['tokenAmount']['decimals'] == 6;
      });
      if (valid.length != 1) return AccessTier.free;
      final source = valid.single['parsed']['info']['source'];
      final destIndex =
          keys.toList().indexWhere((k) => k['pubkey'] == recipientAta);
      final srcIndex = keys.toList().indexWhere((k) => k['pubkey'] == source);
      if (destIndex < 0 || srcIndex < 0 || source == recipientAta) {
        return AccessTier.free;
      }
      int amount(String key, int index, String owner) {
        final values = (tx['meta'][key] as List).where((v) =>
            v['accountIndex'] == index &&
            v['mint'] == skrMint &&
            v['owner'] == owner &&
            v['uiTokenAmount']['decimals'] == 6);
        return values.isEmpty
            ? 0
            : int.parse(values.single['uiTokenAmount']['amount']);
      }

      final credited = amount('postTokenBalances', destIndex, merchant) -
          amount('preTokenBalances', destIndex, merchant);
      final debited = amount('preTokenBalances', srcIndex, wallet) -
          amount('postTokenBalances', srcIndex, wallet);
      if (credited == skrPrice && debited == skrPrice) return AccessTier.skr;
    }
  } catch (_) {
    return AccessTier.free;
  }
  return AccessTier.free;
}

class PaymentService {
  final _storage = const FlutterSecureStorage();
  bool _busy = false;
  static const _receiptKey = 'degen_mainnet_receipt_v1';
  static const _pendingKey = 'degen_pending_v1';
  PurchaseReceipt? receipt;
  Map<String, dynamic>? pending;
  bool get busy => _busy;

  Future<void> resetLocalProForOwnerTest() async {
    if (!ownerTestTools || kIsWeb || qaBuild) {
      throw const PaymentFailure('testResetUnavailable');
    }
    if (_busy || pending != null) {
      throw const PaymentFailure('pendingPayment');
    }
    _busy = true;
    try {
      if (await _storage.read(key: _pendingKey) != null) {
        throw const PaymentFailure('pendingPayment');
      }
      final stored = await _storage.read(key: _receiptKey);
      if (stored != null) {
        await _storage.write(
            key: 'degen_owner_test_receipt_backup_v1', value: stored);
      }
      await _storage.delete(key: _receiptKey);
      receipt = null;
    } finally {
      _busy = false;
    }
  }

  Future<dynamic> rpc(String method, List<dynamic> params) async {
    final uri = Uri.parse(rpcEndpoint);
    if (uri.scheme != 'https') throw const PaymentFailure('networkError');
    final response = await http
        .post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
              {'jsonrpc': '2.0', 'id': 1, 'method': method, 'params': params}),
        )
        .timeout(const Duration(seconds: 25));
    if (response.statusCode != 200) throw const PaymentFailure('networkError');
    final data = jsonDecode(response.body) as Map;
    if (data['error'] != null) throw const PaymentFailure('networkError');
    return data['result'];
  }

  Future<void> _checkNetwork() async {
    if (await rpc('getGenesisHash', []) != mainnetGenesis) {
      throw const PaymentFailure('networkError');
    }
  }

  Future<void> load() async {
    if (kIsWeb || qaBuild) return;
    try {
      final stored = await _storage.read(key: _receiptKey);
      if (stored != null) {
        receipt = PurchaseReceipt.fromJson(jsonDecode(stored));
      }
      final saved = await _storage.read(key: _pendingKey);
      if (saved != null) pending = Map<String, dynamic>.from(jsonDecode(saved));
    } catch (_) {
      // A damaged or migrated secure store must not manufacture an entitlement.
      receipt = null;
    }
  }

  Future<T> _wallet<T>(
      Future<T> Function(MobileWalletAdapterClient, Ed25519HDPublicKey)
          body) async {
    if (kIsWeb || qaBuild) throw const PaymentFailure('androidPayment');
    if (!await LocalAssociationScenario.isAvailable()) {
      throw const PaymentFailure('noWallet');
    }
    final session = await LocalAssociationScenario.create();
    var walletReturned = Future<bool>.value(false);
    var operationCompleted = false;
    try {
      walletReturned =
          observeWalletReturn(session.startActivityForResult(null));
      final client = await session.start().timeout(const Duration(seconds: 45));
      final auth = await client
          .authorize(identityName: 'Degen Detox', cluster: 'mainnet-beta')
          .timeout(const Duration(seconds: 90));
      if (auth == null) throw const PaymentFailure('walletCancelled');
      final value = await body(client, Ed25519HDPublicKey(auth.publicKey));
      operationCompleted = true;
      return value;
    } finally {
      await finishWalletHandoff(
          close: session.close,
          walletReturned: walletReturned,
          operationCompleted: operationCompleted);
    }
  }

  Future<String> recipientTokenAccount() async =>
      (await findAssociatedTokenAddress(
              owner: Ed25519HDPublicKey.fromBase58(merchant),
              mint: Ed25519HDPublicKey.fromBase58(skrMint)))
          .toBase58();

  Future<PurchaseReceipt> _checkReceipt(String signature, String wallet) async {
    final statuses = await rpc('getSignatureStatuses', [
      [signature],
      {'searchTransactionHistory': true}
    ]);
    final state = (statuses['value'] as List).first;
    if (state == null || state['confirmationStatus'] != 'finalized') {
      throw const PaymentFailure('pendingPayment');
    }
    if (state['err'] != null) throw const PaymentFailure('paymentFailed');
    final tx = await rpc('getTransaction', [
      signature,
      {
        'encoding': 'jsonParsed',
        'commitment': 'finalized',
        'maxSupportedTransactionVersion': 0
      }
    ]);
    if (tx == null) throw const PaymentFailure('pendingPayment');
    final tier = verifyPayment(Map<String, dynamic>.from(tx), wallet, signature,
        await recipientTokenAccount());
    if (tier == AccessTier.free) throw const PaymentFailure('invalidReceipt');
    return PurchaseReceipt(wallet, signature, tier);
  }

  Future<void> _save(PurchaseReceipt value) async {
    // A SOL restore must never downgrade an existing SKR receipt.
    if (receipt?.tier == AccessTier.skr && value.tier == AccessTier.sol) return;
    await _storage.write(key: _receiptKey, value: jsonEncode(value.toJson()));
    receipt = value;
    await _storage.delete(key: _pendingKey);
    pending = null;
  }

  Future<PurchaseReceipt> buy(AccessTier tier) async {
    if (_busy) throw const PaymentFailure('busyPayment');
    if (tier == AccessTier.free) throw const PaymentFailure('invalidReceipt');
    if (pending != null) throw const PaymentFailure('pendingPayment');
    if (receipt != null) throw const PaymentFailure('alreadyOwned');
    _busy = true;
    try {
      await _checkNetwork();
      final info = await _wallet((client, payer) async {
        final owner = payer.toBase58();
        if (owner == merchant) throw const PaymentFailure('merchantWallet');
        final mint = Ed25519HDPublicKey.fromBase58(skrMint);
        final recipient = Ed25519HDPublicKey.fromBase58(merchant);
        final instructions = <Instruction>[];
        if (tier == AccessTier.sol) {
          instructions.add(SystemInstruction.transfer(
              fundingAccount: payer,
              recipientAccount: recipient,
              lamports: solPrice));
        } else {
          final m = await rpc('getAccountInfo', [
            skrMint,
            {'encoding': 'jsonParsed', 'commitment': 'finalized'}
          ]);
          if (m['value']?['owner'] != tokenProgram ||
              m['value']?['data']?['parsed']?['info']?['decimals'] != 6) {
            throw const PaymentFailure('invalidReceipt');
          }
          final source =
              await findAssociatedTokenAddress(owner: payer, mint: mint);
          final dest =
              await findAssociatedTokenAddress(owner: recipient, mint: mint);
          final destination = await rpc('getAccountInfo', [
            dest.toBase58(),
            {'encoding': 'jsonParsed', 'commitment': 'confirmed'}
          ]);
          if (destination['value'] == null) {
            // Idempotent create avoids a concurrent first-purchaser race.
            final create = AssociatedTokenAccountInstruction.createAccount(
                funder: payer, address: dest, owner: recipient, mint: mint);
            instructions.add(Instruction(
                programId: create.programId,
                accounts: create.accounts,
                data: ByteArray(const [1])));
          }
          instructions.add(TokenInstruction.transferChecked(
              amount: skrPrice,
              decimals: 6,
              source: source,
              mint: mint,
              destination: dest,
              owner: payer));
        }
        final nonce = List.generate(16, (_) => Random.secure().nextInt(256))
            .map((v) => v.toRadixString(16).padLeft(2, '0'))
            .join();
        instructions.add(MemoInstruction(
            signers: [payer],
            memo:
                'DD1|lifetime|${tier == AccessTier.sol ? 'SOL' : 'SKR'}|$owner|$nonce'));
        final latest = await rpc('getLatestBlockhash', [
          {'commitment': 'confirmed'}
        ]);
        final message = Message(instructions: instructions).compile(
            recentBlockhash: latest['value']['blockhash'], feePayer: payer);
        final unsigned = SignedTx(
            compiledMessage: message,
            signatures: [Signature(List.filled(64, 0), publicKey: payer)]);
        final signed = await client.signTransactions(transactions: [
          Uint8List.fromList(unsigned.toByteArray().toList())
        ]).timeout(const Duration(seconds: 120));
        if (signed.signedPayloads.length != 1) {
          throw const PaymentFailure('walletCancelled');
        }
        final raw = signed.signedPayloads.single;
        final compiled = message.toByteArray().toList();
        // Wallet may sign but cannot silently alter the transaction we displayed.
        if (raw.length != compiled.length + 65 ||
            raw[0] != 1 ||
            !listEquals(raw.sublist(65), compiled)) {
          throw const PaymentFailure('invalidReceipt');
        }
        final signatureBytes = raw.sublist(1, 65);
        final valid = await crypto.Ed25519().verify(compiled,
            signature: crypto.Signature(signatureBytes,
                publicKey: crypto.SimplePublicKey(payer.bytes,
                    type: crypto.KeyPairType.ed25519)));
        if (!valid) throw const PaymentFailure('invalidReceipt');
        final signature = base58.encode(signatureBytes);
        // Save before broadcast: a network timeout must never prompt a second charge.
        pending = {
          'wallet': owner,
          'signature': signature,
          'tier': tier.name,
          'lastValidBlockHeight': latest['value']['lastValidBlockHeight']
        };
        await _storage.write(key: _pendingKey, value: jsonEncode(pending));
        return (raw: raw, wallet: owner, signature: signature);
      });
      await rpc('sendTransaction', [
        base64Encode(info.raw),
        {
          'encoding': 'base64',
          'skipPreflight': false,
          'preflightCommitment': 'confirmed',
          'maxRetries': 3
        }
      ]);
      for (var i = 0; i < 24; i++) {
        try {
          final value = await _checkReceipt(info.signature, info.wallet);
          await _save(value);
          return value;
        } on PaymentFailure catch (e) {
          if (e.code != 'pendingPayment') rethrow;
        }
        await Future<void>.delayed(const Duration(seconds: 3));
      }
      throw const PaymentFailure('pendingPayment');
    } on TimeoutException {
      throw PaymentFailure(
          pending == null ? 'walletCancelled' : 'pendingPayment');
    } finally {
      _busy = false;
    }
  }

  Future<String> _proveWallet() => _wallet((client, payer) async {
        final nonce = base64UrlEncode(
            List.generate(32, (_) => Random.secure().nextInt(256)));
        final message = Uint8List.fromList(utf8.encode(
            'Degen Detox: restore lifetime purchase only. No transaction.\n'
            'Wallet: ${payer.toBase58()}\nNonce: $nonce\n${DateTime.now().toUtc().toIso8601String()}'));
        final result = await client.signMessages(
            messages: [message], addresses: [Uint8List.fromList(payer.bytes)]);
        if (result.signedMessages.length != 1) {
          throw const PaymentFailure('walletCancelled');
        }
        final signed = result.signedMessages.single;
        if (!listEquals(signed.message, message) ||
            signed.signatures.length != 1 ||
            signed.addresses.length != 1 ||
            !listEquals(signed.addresses.single, payer.bytes) ||
            !await crypto.Ed25519().verify(message,
                signature: crypto.Signature(signed.signatures.single,
                    publicKey: crypto.SimplePublicKey(payer.bytes,
                        type: crypto.KeyPairType.ed25519)))) {
          throw const PaymentFailure('invalidReceipt');
        }
        return payer.toBase58();
      });

  Future<PurchaseReceipt> restore({String? signature}) async {
    if (_busy) throw const PaymentFailure('busyPayment');
    _busy = true;
    try {
      await _checkNetwork();
      final wallet = await _proveWallet();
      final explicit = signature?.trim();
      if (explicit != null && explicit.isNotEmpty) {
        if (base58.decode(explicit).length != 64) {
          throw const PaymentFailure('invalidReceipt');
        }
        final value = await _checkReceipt(explicit, wallet);
        await _save(value);
        return value;
      }
      if (pending?['wallet'] == wallet) {
        try {
          final value = await _checkReceipt(pending!['signature'], wallet);
          await _save(value);
          return value;
        } on PaymentFailure catch (e) {
          if (e.code != 'pendingPayment' && e.code != 'paymentFailed') rethrow;
          final states = await rpc('getSignatureStatuses', [
            [pending!['signature']],
            {'searchTransactionHistory': true}
          ]);
          final state = (states['value'] as List).first;
          final height = await rpc('getBlockHeight', [
            {'commitment': 'finalized'}
          ]);
          // A confirmed-but-not-finalized payment stays pending regardless of height.
          if ((state == null && height > pending!['lastValidBlockHeight']) ||
              (state != null && state['err'] != null)) {
            await _storage.delete(key: _pendingKey);
            pending = null;
            throw const PaymentFailure('paymentFailed');
          }
          throw const PaymentFailure('pendingPayment');
        }
      }
      if (receipt?.wallet == wallet) {
        final value = await _checkReceipt(receipt!.signature, wallet);
        await _save(value);
        return value;
      }
      String? before;
      PurchaseReceipt? best;
      // Bounded scan; receipt import covers very active/old wallets without paying again.
      for (var page = 0; page < 10; page++) {
        final history = await rpc('getSignaturesForAddress', [
          wallet,
          {
            'limit': 100,
            'commitment': 'finalized',
            if (before != null) 'before': before
          }
        ]) as List;
        for (final item in history) {
          if (item['err'] != null ||
              !(item['memo']?.toString().contains('DD1|lifetime|') ?? false)) {
            continue;
          }
          try {
            final value = await _checkReceipt(item['signature'], wallet);
            best = value;
            if (value.tier == AccessTier.skr) break;
          } on PaymentFailure catch (e) {
            if (e.code == 'networkError') rethrow;
          }
        }
        if (best?.tier == AccessTier.skr || history.length < 100) break;
        before = history.last['signature'] as String;
      }
      if (best == null) throw const PaymentFailure('receiptNotFound');
      await _save(best);
      return best;
    } on TimeoutException {
      throw const PaymentFailure('networkError');
    } finally {
      _busy = false;
    }
  }
}
