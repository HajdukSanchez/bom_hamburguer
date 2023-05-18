import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';

/// Extension to convert from DTO to Entity
extension MapperCatalogDTO on CatalogDTO {
  /// DTO to Entity
  Catalog toDomain() => Catalog(
        products: products.toDomain(),
        discounts: discounts.toDomain(),
      );
}
