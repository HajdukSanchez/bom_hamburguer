import 'package:bom_hamburguer/common/common.dart';

/// Remote data source to handle Payment requests
// ignore: one_member_abstracts
abstract class PaymentRemoteService {
  /// Handle payment order
  Future<bool> makePayment();
}

/// Implementation of [PaymentRemoteService]
class PaymentRemoteServiceImpl extends PaymentRemoteService {
  /// Constructor
  PaymentRemoteServiceImpl();

  @override
  Future<bool> makePayment() {
    try {
      /// Simulate API call
      return Future.delayed(const Duration(seconds: 2), () => true);
    } catch (e) {
      throw CommonStorageFailure(e.toString());
    }
  }
}
