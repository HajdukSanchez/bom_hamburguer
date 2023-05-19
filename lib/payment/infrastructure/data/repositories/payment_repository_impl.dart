import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/payment/payment.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Implementation of the abstract repository class [PaymentRepository]
@injectable
class PaymentRepositoryImpl implements PaymentRepository {
  /// Constructor
  PaymentRepositoryImpl(this._remoteService);

  final PaymentRemoteService _remoteService;

  @override
  Future<Either<Exception, bool>> makePayment() async {
    try {
      final result = await _remoteService.makePayment();

      return Right(result);
    } on CommonStorageFailure catch (e) {
      return Left(CommonStorageFailure(e.error));
    }
  }
}
