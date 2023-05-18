import 'package:bom_hamburguer/common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tProducts = <ProductDTO>[];
  const tDiscount = 15.9;
  final tJson = {
    'products': tProducts,
    'discount': tDiscount,
  };

  group('FromJson and ToJson', () {
    test(
      'should perform FromJson success',
      () async {
        // act
        final resultDTO = DiscountRuleDTO.fromJson(tJson);
        // assert
        expect(resultDTO.products, isA<List<ProductDTO>>());
        expect(resultDTO.discount, tDiscount);
        expect(resultDTO, isA<DiscountRuleDTO>());
      },
    );

    test(
      'should perform ToJson success',
      () async {
        // arrange
        const tDTO = DiscountRuleDTO(
          products: tProducts,
          discount: tDiscount,
        );
        // act
        final resultJson = tDTO.toJson();
        // assert
        expect(resultJson, tJson);
      },
    );
  });
}
