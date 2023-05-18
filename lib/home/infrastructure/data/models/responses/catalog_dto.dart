// ignore_for_file: invalid_annotation_target

import 'package:bom_hamburguer/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_dto.freezed.dart';
part 'catalog_dto.g.dart';

/// Catalog data to show on home
@freezed
class CatalogDTO with _$CatalogDTO {
  /// Named constructor
  const factory CatalogDTO({
    /// Products
    @JsonKey(name: 'products') required List<ProductDTO> products,

    /// Discounts rules
    @JsonKey(name: 'discounts') required List<DiscountRuleDTO> discounts,
  }) = _CatalogDTO;

  /// Empty constructor
  const CatalogDTO._();

  /// Function to handle `fromJson` and `toJson`
  factory CatalogDTO.fromJson(Map<String, dynamic> json) =>
      _$CatalogDTOFromJson(json);
}
