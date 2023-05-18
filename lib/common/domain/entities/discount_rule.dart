import 'package:bom_hamburguer/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_rule.freezed.dart';

/// Information about rules of discounts
@freezed
class DiscountRule with _$DiscountRule {
  /// Named constructor
  const factory DiscountRule({
    /// DiscountRule to be applied
    required double discount,

    /// Products valid on the discount
    required List<Product> products,
  }) = _DiscountRule;

  /// Empty constructor
  const DiscountRule._();
}
