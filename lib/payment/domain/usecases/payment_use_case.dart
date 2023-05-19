import 'package:bom_hamburguer/payment/payment.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Use case for handle payment
@injectable
class PaymentUseCase {
  /// Constructor
  PaymentUseCase(this._repository);

  final PaymentRepository _repository;

  Future<Either<Exception, bool>> execute() async {
    return _repository.makePayment();
  }
}
