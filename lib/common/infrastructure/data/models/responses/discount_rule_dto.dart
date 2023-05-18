// ignore_for_file: invalid_annotation_target

import 'package:bom_hamburguer/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_rule_dto.freezed.dart';
part 'discount_rule_dto.g.dart';

/// Rules of discounts to be applied
@freezed
class DiscountRuleDTO with _$DiscountRuleDTO {
  /// Named constructor
  const factory DiscountRuleDTO({
    /// List of products on the rule
    @JsonKey(name: 'products') required List<ProductDTO> products,

    /// Discount value
    @JsonKey(name: 'discount') required double discount,
  }) = _DiscountRuleDTO;

  /// Empty constructor
  const DiscountRuleDTO._();

  /// Function to handle `fromJson` and `toJson`
  factory DiscountRuleDTO.fromJson(Map<String, dynamic> json) =>
      _$DiscountRuleDTOFromJson(json);
}
