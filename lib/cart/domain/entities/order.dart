import 'package:bom_hamburguer/cart/cart.dart';
import 'package:bom_hamburguer/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';

/// Order with cart to be purchased
@freezed
class Order with _$Order {
  /// Named constructor
  const factory Order({
    /// Cart with products
    required Cart cart,

    /// User to process order
    required User user,
  }) = _Order;

  /// Empty constructor
  const Order._();
}
