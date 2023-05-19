import 'package:bom_hamburguer/common/common.dart';

/// Extension to handle with List of Products
extension ListProductExtension on List<Product> {
  String get toStringItems {
    return map((product) => product.name).join(', ');
  }
}
