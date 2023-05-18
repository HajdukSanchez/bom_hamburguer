import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';

/// Remote data source to handle Home requests
// ignore: one_member_abstracts
abstract class HomeLocalService {
  Future<CatalogDTO> getLocalCatalog();
}

/// Implementation of [HomeLocalService]
class HomeLocalServiceImpl implements HomeLocalService {
  /// Constructor
  HomeLocalServiceImpl();

  @override
  Future<CatalogDTO> getLocalCatalog() async {
    try {
      // TODO: ADD local storage implementation
      const product = ProductDTO(
        id: 1,
        name: 'Termo',
        price: 10,
        image: '',
        type: ProductType.main,
      );

      /// Simulate API call
      return Future.delayed(
        const Duration(seconds: 3),
        () => const CatalogDTO(
          products: [product],
          discounts: [
            DiscountRuleDTO(products: [product], discount: 15)
          ],
        ),
      );
    } catch (e) {
      throw CommonStorageFailure(e.toString());
    }
  }
}
