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
}
