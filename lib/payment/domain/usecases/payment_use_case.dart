import 'package:bom_hamburguer/payment/payment.dart';
import 'package:dartz/dartz.dart';

/// Use case for handle payment
class PaymentUseCase {
  /// Constructor
  PaymentUseCase();

  final _repository = PaymentRepositoryImpl();

  Future<Either<Exception, bool>> execute() async {
    return _repository.makePayment();
  }
}
