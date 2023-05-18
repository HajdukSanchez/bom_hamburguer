import 'package:bom_hamburguer/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

/// Information about products handle by User
@freezed
class Product with _$Product {
  /// Named constructor
  const factory Product({
    /// Product ID
    required int id,

    /// Product Name
    required String name,

    /// Product price
    required double price,

    /// Product image URL
    required String image,

    /// Product type
    required ProductType type,
  }) = _Product;

  /// Empty constructor
  const Product._();
}
