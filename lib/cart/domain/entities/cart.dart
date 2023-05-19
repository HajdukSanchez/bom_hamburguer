import 'package:bom_hamburguer/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart.freezed.dart';

/// Cart with products to be purchased
@freezed
class Cart with _$Cart {
  /// Named constructor
  const factory Cart({
    /// List of products
    required List<Product> products,
  }) = _Cart;

  /// Empty constructor
  const Cart._();
}
