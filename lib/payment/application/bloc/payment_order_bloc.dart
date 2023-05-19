import 'package:bloc/bloc.dart';
import 'package:bom_hamburguer/payment/payment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'payment_order_event.dart';
part 'payment_order_state.dart';
part 'payment_order_bloc.freezed.dart';

/// Bloc to handle payment order
@injectable
class PaymentOrderBloc extends Bloc<PaymentOrderEvent, PaymentOrderState> {
  /// Constructor
  PaymentOrderBloc(this._useCase) : super(const _Initial()) {
    on<PaymentOrderEvent>(
      (event, emit) => event.when(
        pay: (order) => _handlePayment(event, emit),
      ),
    );
  }

  final PaymentUseCase _useCase;

  // Get initial catalog data
  Future<void> _handlePayment(
    PaymentOrderEvent event,
    Emitter<PaymentOrderState> emit,
  ) async {
    emit(const PaymentOrderState.loading());

    final result = await _useCase.execute();
    emit(
      result.fold(
        PaymentOrderState.error,
        (data) => PaymentOrderState.data(isSuccessfully: data),
      ),
    );
  }
}
