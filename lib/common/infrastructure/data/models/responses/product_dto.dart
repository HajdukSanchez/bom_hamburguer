// ignore_for_file: invalid_annotation_target

import 'package:bom_hamburguer/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

/// Product data to be transformed on Mapper layer
@freezed
class ProductDTO with _$ProductDTO {
  /// Named constructor
  const factory ProductDTO({
    /// ProductDTO ID
    @JsonKey(name: 'id') required int id,

    /// ProductDTO Name
    @JsonKey(name: 'name') required String name,

    /// ProductDTO price
    @JsonKey(name: 'price') required double price,

    /// ProductDTO image URL
    @JsonKey(name: 'image') required String image,

    /// ProductDTO type
    @JsonKey(name: 'type', unknownEnumValue: ProductType.addition)
        required ProductType type,
  }) = _ProductDTO;

  /// Empty constructor
  const ProductDTO._();

  /// Function to handle `fromJson` and `toJson`
  factory ProductDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductDTOFromJson(json);
}
