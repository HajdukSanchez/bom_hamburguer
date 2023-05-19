part of 'payment_order_bloc.dart';

/// States to handle payment order
@freezed
class PaymentOrderState with _$PaymentOrderState {
  /// Initial state
  const factory PaymentOrderState.initial() = _Initial;

  /// Loading data state
  const factory PaymentOrderState.loading() = _Loading;

  /// Data loaded state
  const factory PaymentOrderState.data({required bool isSuccessfully}) = _Data;

  /// Error getting data state
  const factory PaymentOrderState.error(Exception error) = _Error;
}
