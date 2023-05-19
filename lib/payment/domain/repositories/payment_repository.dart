import 'package:dartz/dartz.dart';

/// Contract repository for Payment
// ignore: one_member_abstracts
abstract class PaymentRepository {
  /// Handle payment order
  Future<Either<Exception, bool>> makePayment();
}
