import 'package:bom_hamburguer/common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tId = 0;
  const tName = 'name';
  const tPrice = 0.9;
  const tImage = '';
  const tType = 'addition';
  final tJson = {
    'id': tId,
    'name': tName,
    'price': tPrice,
    'image': tImage,
    'type': tType,
  };

  group('FromJson and ToJson', () {
    test(
      'should perform FromJson success',
      () async {
        // act
        final resultDTO = ProductDTO.fromJson(tJson);
        // assert
        expect(resultDTO.id, tId);
        expect(resultDTO.name, tName);
        expect(resultDTO.price, tPrice);
        expect(resultDTO.image, tImage);
        expect(resultDTO.type, ProductType.addition);
        expect(resultDTO, isA<ProductDTO>());
      },
    );

    test(
      'should perform ToJson success',
      () async {
        // arrange
        const tDTO = ProductDTO(
          id: tId,
          image: tImage,
          name: tName,
          price: tPrice,
          type: ProductType.addition,
        );
        // act
        final resultJson = tDTO.toJson();
        // assert
        expect(resultJson, tJson);
      },
    );
  });
}
