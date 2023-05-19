import 'package:bom_hamburguer/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog.freezed.dart';

/// Catalog with products and discount rules
@freezed
class Catalog with _$Catalog {
  /// Named constructor
  const factory Catalog({
    /// Products to show
    required List<Product> products,

    /// Discount rules to be applied
    required List<DiscountRule> discounts,
  }) = _Catalog;

  /// Empty constructor
  const Catalog._();

  /// Validate if there is main products
  bool get areMainProductsAvailable {
    return products.any((product) => product.type == ProductType.main);
  }

  /// Validate if there is some extra products
  bool get areAdditionProductsAvailable {
    return products.any((product) => product.type == ProductType.addition);
  }

  /// Get a list of the main products
  List<Product> get mainProducts {
    return products
        .where((product) => product.type == ProductType.main)
        .toList();
  }

  /// Get a list with the addition products
  List<Product> get additionProducts {
    return products
        .where((product) => product.type == ProductType.addition)
        .toList();
  }

  /// There is some discount rule valid to applied
  bool areDiscountsAvailable(List<Product> products) {
    return discounts.any((discount) => discount.discountRuleIsValid(products));
  }

  /// Get the first discount rule valid to be applied
  DiscountRule getDiscountRule(List<Product> products) {
    return discounts.firstWhere(
      (discount) => discount.discountRuleIsValid(products),
    );
  }
}
