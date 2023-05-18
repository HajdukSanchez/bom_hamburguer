import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tProducts = <ProductDTO>[];
  const tDiscounts = <DiscountRuleDTO>[];
  final tJson = {
    'products': tProducts,
    'discounts': tDiscounts,
  };

  group('FromJson and ToJson', () {
    test(
      'should perform FromJson success',
      () async {
        // act
        final resultDTO = CatalogDTO.fromJson(tJson);
        // assert
        expect(resultDTO.products, isA<List<ProductDTO>>());
        expect(resultDTO.discounts, isA<List<DiscountRuleDTO>>());
        expect(resultDTO, isA<CatalogDTO>());
      },
    );

    test(
      'should perform ToJson success',
      () async {
        // arrange
        const tDTO = CatalogDTO(
          products: tProducts,
          discounts: tDiscounts,
        );
        // act
        final resultJson = tDTO.toJson();
        // assert
        expect(resultJson, tJson);
      },
    );
  });
}
