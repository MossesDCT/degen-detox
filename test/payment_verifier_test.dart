import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:degen_detox/degen/domain.dart';
import 'package:degen_detox/degen/payments.dart';
import 'package:degen_detox/degen/purchase_strings.dart';

const payer = 'payer-test';
const signature = 'signature-test';
const ata = 'recipient-ata';

Map<String, dynamic> transaction({bool skr = false}) => {
      'meta': <String, dynamic>{
        'err': null,
        'preBalances': [200000000, 10, 0, 0],
        'postBalances': [99995000, 100000010, 0, 0],
        'preTokenBalances': [
          {
            'accountIndex': 2,
            'mint': skrMint,
            'owner': payer,
            'uiTokenAmount': {'amount': '900000000', 'decimals': 6}
          },
        ],
        'postTokenBalances': [
          {
            'accountIndex': 2,
            'mint': skrMint,
            'owner': payer,
            'uiTokenAmount': {'amount': '400000000', 'decimals': 6}
          },
          {
            'accountIndex': 3,
            'mint': skrMint,
            'owner': merchant,
            'uiTokenAmount': {'amount': '500000000', 'decimals': 6}
          },
        ],
      },
      'transaction': {
        'signatures': [signature],
        'message': {
          'accountKeys': [
            {'pubkey': payer, 'signer': true},
            {'pubkey': merchant, 'signer': false},
            {'pubkey': 'payer-ata', 'signer': false},
            {'pubkey': ata, 'signer': false},
          ],
          'instructions': [
            if (!skr)
              {
                'programId': '11111111111111111111111111111111',
                'parsed': {
                  'type': 'transfer',
                  'info': {
                    'source': payer,
                    'destination': merchant,
                    'lamports': solPrice,
                  }
                },
              }
            else
              {
                'programId': tokenProgram,
                'parsed': {
                  'type': 'transferChecked',
                  'info': {
                    'authority': payer,
                    'source': 'payer-ata',
                    'mint': skrMint,
                    'destination': ata,
                    'tokenAmount': {'amount': '$skrPrice', 'decimals': 6},
                  }
                },
              },
            {
              'programId': memoProgram,
              'parsed':
                  'DD1|lifetime|${skr ? 'SKR' : 'SOL'}|$payer|0123456789abcdef0123456789abcdef'
            },
          ],
        },
      },
    };

void main() {
  Map<String, dynamic> copy(Map<String, dynamic> t) =>
      jsonDecode(jsonEncode(t));
  test('exact SOL payment unlocks Pro, not SKR benefits', () {
    expect(verifyPayment(transaction(), payer, signature, ata), AccessTier.sol);
  });
  test('exact SKR mint and 6 decimals unlock SKR tier', () {
    expect(verifyPayment(transaction(skr: true), payer, signature, ata),
        AccessTier.skr);
  });
  test('failed transaction never unlocks', () {
    final tx = transaction()
      ..['meta']['err'] = {
        'InstructionError': [0, 'failure']
      };
    expect(verifyPayment(tx, payer, signature, ata), AccessTier.free);
  });
  test('wrong recipient, underpayment, wrong source and unsigned owner fail',
      () {
    for (final entry in [
      ('destination', 'attacker'),
      ('lamports', solPrice - 1),
      ('source', 'other'),
    ]) {
      final tx = transaction();
      tx['transaction']['message']['instructions'][0]['parsed']['info']
          [entry.$1] = entry.$2;
      expect(verifyPayment(tx, payer, signature, ata), AccessTier.free);
    }
    final tx = transaction();
    tx['transaction']['message']['accountKeys'][0]['signer'] = false;
    expect(verifyPayment(tx, payer, signature, ata), AccessTier.free);
  });
  test('wrong memo, amount, mint, decimals, owner and program rejected', () {
    final base = transaction(skr: true);
    final mutations = <void Function(Map<String, dynamic>)>[
      (t) => t['transaction']['message']['instructions'][1]['parsed'] =
          'ordinary payment',
      (t) => t['transaction']['message']['instructions'][0]['parsed']['info']
          ['mint'] = 'counterfeit',
      (t) => t['transaction']['message']['instructions'][0]['parsed']['info']
          ['tokenAmount']['amount'] = '499999999',
      (t) => t['transaction']['message']['instructions'][0]['parsed']['info']
          ['tokenAmount']['decimals'] = 9,
      (t) => t['transaction']['message']['instructions'][0]['programId'] =
          'counterfeit',
      (t) => t['meta']['postTokenBalances'][1]['owner'] = 'attacker',
      (t) => t['meta']['postTokenBalances'][1]['uiTokenAmount']['amount'] = '0',
      (t) => t['meta']['preTokenBalances'][0]['owner'] = 'attacker',
    ];
    for (final mutate in mutations) {
      final tx = copy(base);
      mutate(tx);
      expect(verifyPayment(tx, payer, signature, ata), AccessTier.free);
    }
  });
  test('replayed receipt cannot bind another wallet or signature', () {
    expect(verifyPayment(transaction(), 'other-wallet', signature, ata),
        AccessTier.free);
    expect(verifyPayment(transaction(), payer, 'other-signature', ata),
        AccessTier.free);
    expect(verifyPayment(transaction(), merchant, signature, ata),
        AccessTier.free);
  });
  test('fake SOL credit and duplicate transfer fail', () {
    final tx = transaction();
    tx['meta']['postBalances'][1] = 10;
    expect(verifyPayment(tx, payer, signature, ata), AccessTier.free);
    final duplicate = transaction();
    final list = duplicate['transaction']['message']['instructions'] as List;
    list.insert(0, list.first);
    expect(verifyPayment(duplicate, payer, signature, ata), AccessTier.free);
  });
  test('malformed and absent fields fail closed', () {
    for (final tx in <Map<String, dynamic>>[
      {},
      {'meta': null},
      {
        'meta': {'err': null}
      }
    ]) {
      expect(verifyPayment(tx, payer, signature, ata), AccessTier.free);
    }
  });
  test('all purchase strings have six translations', () {
    for (final values in purchaseWords.values) {
      expect(values.length, 6);
      expect(values.every((v) => v.trim().isNotEmpty), isTrue);
    }
  });
  test('receipt decoder rejects other networks and free tiers', () {
    expect(
        PurchaseReceipt.fromJson({'network': 'devnet', 'tier': 'skr'}), isNull);
    expect(
        PurchaseReceipt.fromJson({'network': 'mainnet-beta', 'tier': 'free'}),
        isNull);
  });
}
