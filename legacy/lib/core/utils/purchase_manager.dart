import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_strings.dart';

/// Result type for purchase operations.
enum PurchaseResult {
  success,
  cancelled,
  alreadyOwned,
  pending,
  error,
}

/// Singleton manager for in-app purchases via the [InAppPurchase] plugin.
///
/// Responsibilities:
/// - Initialize the purchase stream on app start
/// - Query available products (product ID: "cortisol_zero_pro")
/// - Make purchases and handle results
/// - Auto-acknowledge purchases (required for Google Play Billing)
/// - Persist and check PRO status in SharedPreferences
class PurchaseManager {
  PurchaseManager._internal();
  static final PurchaseManager instance = PurchaseManager._internal();

  final InAppPurchase _iap = InAppPurchase.instance;

  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;
  ProductDetails? _proProduct;

  bool _isProUser = false;
  bool _isLoading = false;

  bool get isProUser => _isProUser;
  bool get isLoading => _isLoading;
  ProductDetails? get proProduct => _proProduct;

  // Callbacks for UI state updates
  VoidCallback? onPurchaseSuccess;
  VoidCallback? onPurchaseError;
  VoidCallback? onStateChanged;

  // ─── Initialization ───────────────────────────────────────────────────────

  /// Call once at app startup (after DI is ready).
  Future<void> initialize() async {
    // Restore PRO status from local storage
    await _loadProStatus();

    // Check if purchases are available on this platform
    final available = await _iap.isAvailable();
    if (!available) {
      debugPrint('[PurchaseManager] Store not available on this device.');
      return;
    }

    // Listen to purchase updates
    _purchaseSubscription = _iap.purchaseStream.listen(
      _handlePurchaseUpdate,
      onDone: () => _purchaseSubscription?.cancel(),
      onError: (Object error) {
        debugPrint('[PurchaseManager] Purchase stream error: $error');
      },
    );

    // Load product details
    await _loadProducts();
  }

  /// Clean up subscription on app dispose.
  void dispose() {
    _purchaseSubscription?.cancel();
  }

  // ─── Product Loading ──────────────────────────────────────────────────────

  /// Queries the store for the PRO product details.
  Future<void> _loadProducts() async {
    const productIds = {AppStrings.proProductId};

    final ProductDetailsResponse response =
        await _iap.queryProductDetails(productIds);

    if (response.error != null) {
      debugPrint(
          '[PurchaseManager] Product query error: ${response.error?.message}');
      return;
    }

    if (response.productDetails.isNotEmpty) {
      _proProduct = response.productDetails.first;
      debugPrint(
          '[PurchaseManager] Loaded product: ${_proProduct?.title} - ${_proProduct?.price}');
    } else {
      debugPrint('[PurchaseManager] No products found for IDs: $productIds');
      debugPrint('[PurchaseManager] Not found IDs: ${response.notFoundIDs}');
    }
  }

  // ─── Purchase Flow ────────────────────────────────────────────────────────

  /// Initiates the purchase flow for PRO upgrade.
  /// Returns a [PurchaseResult] indicating outcome.
  Future<PurchaseResult> purchasePro() async {
    if (_isProUser) return PurchaseResult.alreadyOwned;
    if (_proProduct == null) {
      await _loadProducts();
      if (_proProduct == null) return PurchaseResult.error;
    }

    _isLoading = true;
    onStateChanged?.call();

    final purchaseParam = PurchaseParam(productDetails: _proProduct!);

    try {
      // non-consumable one-time purchase
      final result = await _iap.buyNonConsumable(
        purchaseParam: purchaseParam,
      );
      if (!result) {
        _isLoading = false;
        onStateChanged?.call();
        return PurchaseResult.error;
      }
      // Result is handled asynchronously in _handlePurchaseUpdate
      return PurchaseResult.pending;
    } catch (e) {
      debugPrint('[PurchaseManager] Purchase error: $e');
      _isLoading = false;
      onStateChanged?.call();
      return PurchaseResult.error;
    }
  }

  /// Restores previous purchases (required for iOS App Store).
  Future<void> restorePurchases() async {
    _isLoading = true;
    onStateChanged?.call();
    await _iap.restorePurchases();
    // Results handled in _handlePurchaseUpdate
  }

  // ─── Purchase Stream Handler ──────────────────────────────────────────────

  Future<void> _handlePurchaseUpdate(
      List<PurchaseDetails> purchaseDetails) async {
    for (final purchase in purchaseDetails) {
      debugPrint(
          '[PurchaseManager] Purchase update: ${purchase.productID} - ${purchase.status}');

      if (purchase.productID != AppStrings.proProductId) continue;

      switch (purchase.status) {
        case PurchaseStatus.pending:
          // Show pending UI - handled by loading state
          break;

        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          // Verify and acknowledge the purchase
          final verified = await _verifyPurchase(purchase);
          if (verified) {
            await _deliverPro(purchase);
            // Acknowledge purchase on Android
            if (Platform.isAndroid && purchase.pendingCompletePurchase) {
              await _iap.completePurchase(purchase);
            }
          }
          break;

        case PurchaseStatus.error:
          _isLoading = false;
          onStateChanged?.call();
          onPurchaseError?.call();
          debugPrint(
              '[PurchaseManager] Purchase error: ${purchase.error?.message}');
          break;

        case PurchaseStatus.canceled:
          _isLoading = false;
          onStateChanged?.call();
          break;
      }

      // iOS requires completing purchase even for non-consumables
      if (Platform.isIOS && purchase.pendingCompletePurchase) {
        await _iap.completePurchase(purchase);
      }
    }
  }

  // ─── Verification & Delivery ──────────────────────────────────────────────

  /// Verifies the purchase receipt.
  ///
  /// NOTE: For production, you should verify receipts server-side using
  /// Google Play Developer API or Apple's verifyReceipt endpoint.
  /// This is a simplified local verification.
  Future<bool> _verifyPurchase(PurchaseDetails purchase) async {
    // TODO(production): Implement server-side receipt verification
    // For now, we trust the purchase details from the store
    if (purchase.status == PurchaseStatus.purchased ||
        purchase.status == PurchaseStatus.restored) {
      return true;
    }
    return false;
  }

  /// Grants PRO access after successful purchase.
  Future<void> _deliverPro(PurchaseDetails purchase) async {
    await _saveProStatus(
      isPro: true,
      purchaseToken: purchase.purchaseID ?? '',
    );
    _isLoading = false;
    onPurchaseSuccess?.call();
    onStateChanged?.call();
    debugPrint('[PurchaseManager] PRO access granted!');
  }

  // ─── Persistence ──────────────────────────────────────────────────────────

  Future<void> _loadProStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isProUser = prefs.getBool(AppStrings.keyIsPro) ?? false;
    debugPrint('[PurchaseManager] Loaded PRO status: $_isProUser');
  }

  Future<void> _saveProStatus({
    required bool isPro,
    String purchaseToken = '',
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppStrings.keyIsPro, isPro);
    if (purchaseToken.isNotEmpty) {
      await prefs.setString(AppStrings.keyPurchaseToken, purchaseToken);
    }
    _isProUser = isPro;
  }

  /// Grant PRO for testing/dev purposes (no real purchase).
  Future<void> grantProForDev() async {
    await _saveProStatus(isPro: true, purchaseToken: 'dev_test');
    onStateChanged?.call();
    debugPrint('[PurchaseManager] DEV: PRO access granted (test mode)');
  }

  /// Revoke PRO (for testing/admin purposes only).
  Future<void> revokePro() async {
    await _saveProStatus(isPro: false);
    onStateChanged?.call();
  }

  /// Check PRO status synchronously (after initialization).
  bool checkProStatus() => _isProUser;

  /// Get a display-ready price string for the PRO product.
  String get proPriceString => _proProduct?.price ?? '\$6.50';

  /// Get formatted price with description.
  String get proDescription => 'Cortisol Zero PRO – Lifetime Access';
}
