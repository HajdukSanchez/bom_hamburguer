part of 'payment_order_bloc.dart';

/// Events to handle on payment order
@freezed
class PaymentOrderEvent with _$PaymentOrderEvent {
  /// Pay event
  const factory PaymentOrderEvent.pay({required Order order}) = _Pay;
}
