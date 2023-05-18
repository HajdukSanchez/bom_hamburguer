import 'package:bom_hamburguer/common/common.dart';

/// Extension to convert from DTO to Entity
extension MapperProductDTO on ProductDTO {
  /// DTO to Entity
  Product toDomain() => Product(
        id: id,
        name: name,
        price: price,
        image: image,
        type: type,
      );
}

/// Extension to convert from DTO to Entity
extension MapperListProductDTO on List<ProductDTO> {
  /// DTO to Entity
  List<Product> toDomain() => map((e) => e.toDomain()).toList();
}

/// Extension to convert from DTO to Entity
extension MapperUserDTO on UserDTO {
  /// DTO to Entity
  User toDomain() => User(
        name: name,
      );
}

/// Extension to convert from DTO to Entity
extension MapperDiscountRuleDTO on DiscountRuleDTO {
  /// DTO to Entity
  DiscountRule toDomain() => DiscountRule(
        discount: discount,
        products: products.toDomain(),
      );
}

/// Extension to convert from DTO to Entity
extension MapperListDiscountRuleDTO on List<DiscountRuleDTO> {
  /// DTO to Entity
  List<DiscountRule> toDomain() => map((e) => e.toDomain()).toList();
}
