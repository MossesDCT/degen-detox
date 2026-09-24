import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/purchase_manager.dart';

// ── Events ────────────────────────────────────────────────────────────────────

abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();
  @override
  List<Object?> get props => [];
}

class CheckProStatus extends PurchaseEvent {
  const CheckProStatus();
}

class InitiatePurchase extends PurchaseEvent {
  const InitiatePurchase();
}

class RestorePurchases extends PurchaseEvent {
  const RestorePurchases();
}

class PurchaseSucceeded extends PurchaseEvent {
  const PurchaseSucceeded();
}

class PurchaseFailed extends PurchaseEvent {
  const PurchaseFailed(this.reason);
  final String reason;
  @override
  List<Object?> get props => [reason];
}

// ── States ────────────────────────────────────────────────────────────────────

abstract class PurchaseState extends Equatable {
  const PurchaseState();
  @override
  List<Object?> get props => [];
}

class PurchaseInitial extends PurchaseState {
  const PurchaseInitial();
}

class PurchaseLoading extends PurchaseState {
  const PurchaseLoading();
}

class PurchaseProActive extends PurchaseState {
  const PurchaseProActive();
}

class PurchaseFreeUser extends PurchaseState {
  const PurchaseFreeUser({required this.priceString});
  final String priceString;
  @override
  List<Object?> get props => [priceString];
}

class PurchaseProcessing extends PurchaseState {
  const PurchaseProcessing();
}

class PurchaseSuccess extends PurchaseState {
  const PurchaseSuccess();
}

class PurchaseError extends PurchaseState {
  const PurchaseError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  PurchaseBloc({required this.purchaseManager})
      : super(const PurchaseInitial()) {
    on<CheckProStatus>(_onCheck);
    on<InitiatePurchase>(_onPurchase);
    on<RestorePurchases>(_onRestore);
    on<PurchaseSucceeded>(_onSuccess);
    on<PurchaseFailed>(_onFailed);

    // Register callbacks
    purchaseManager.onPurchaseSuccess = () {
      if (!isClosed) add(const PurchaseSucceeded());
    };
    purchaseManager.onPurchaseError = () {
      if (!isClosed)
        add(const PurchaseFailed('Purchase failed. Please try again.'));
    };
  }

  final PurchaseManager purchaseManager;

  Future<void> _onCheck(
      CheckProStatus event, Emitter<PurchaseState> emit) async {
    emit(const PurchaseLoading());
    if (purchaseManager.isProUser) {
      emit(const PurchaseProActive());
    } else {
      emit(PurchaseFreeUser(priceString: purchaseManager.proPriceString));
    }
  }

  Future<void> _onPurchase(
      InitiatePurchase event, Emitter<PurchaseState> emit) async {
    emit(const PurchaseProcessing());
    final result = await purchaseManager.purchasePro();

    switch (result) {
      case PurchaseResult.alreadyOwned:
        emit(const PurchaseProActive());
        break;
      case PurchaseResult.cancelled:
        emit(PurchaseFreeUser(priceString: purchaseManager.proPriceString));
        break;
      case PurchaseResult.error:
        emit(const PurchaseError('Purchase failed. Please try again.'));
        break;
      case PurchaseResult.pending:
      case PurchaseResult.success:
        // Waiting for stream callback
        break;
    }
  }

  Future<void> _onRestore(
      RestorePurchases event, Emitter<PurchaseState> emit) async {
    emit(const PurchaseProcessing());
    await purchaseManager.restorePurchases();
    // Result comes via stream callback
  }

  Future<void> _onSuccess(
      PurchaseSucceeded event, Emitter<PurchaseState> emit) async {
    emit(const PurchaseSuccess());
  }

  Future<void> _onFailed(
      PurchaseFailed event, Emitter<PurchaseState> emit) async {
    emit(PurchaseError(event.reason));
  }
}
