import 'package:bom_hamburguer/common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const tName = 'name';
  final tJson = {
    'name': tName,
  };

  group('FromJson and ToJson', () {
    test(
      'should perform FromJson success',
      () async {
        // act
        final resultDTO = UserDTO.fromJson(tJson);
        // assert
        expect(resultDTO.name, tName);
        expect(resultDTO, isA<UserDTO>());
      },
    );

    test(
      'should perform ToJson success',
      () async {
        // arrange
        const tDTO = UserDTO(
          name: tName,
        );
        // act
        final resultJson = tDTO.toJson();
        // assert
        expect(resultJson, tJson);
      },
    );
  });
}
