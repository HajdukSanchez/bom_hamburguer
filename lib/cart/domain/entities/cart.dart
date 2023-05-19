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

    /// Possible discount to apply
    DiscountRule? discount,
  }) = _Cart;

  /// Empty constructor
  const Cart._();

  /// Get total amount of products
  String get totalAmount {
    return StringUtils.getFormattedPrice(_getTotalPrice());
  }

  /// Get total amount of products with discount
  String get totalWithDiscount {
    final total = _getTotalPrice();
    if (discount != null) {
      final totalDiscount = total - (total * (discount!.discount / 100));

      return StringUtils.getFormattedPrice(totalDiscount);
    }
    return totalAmount;
  }

  /// Get total price value
  double _getTotalPrice() {
    return products.fold<double>(
      0,
      (prev, actual) => prev + actual.price.toInt(),
    );
  }
}
