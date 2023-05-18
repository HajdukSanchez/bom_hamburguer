import 'package:bom_hamburguer/home/home.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/test_dto_models.dart';

class HomeLocalServiceMock extends Mock implements HomeLocalServiceImpl {}

void main() {
  late HomeLocalServiceImpl remoteService;
  late HomeRepository repository;

  setUp(() {
    remoteService = HomeLocalServiceMock();

    repository = HomeRepositoryImpl();
  });

  group('getCatalog', () {
    test(
      'should get catalog information success',
      () async {
        // arrange
        when(
          () => remoteService.getLocalCatalog(),
        ).thenAnswer((_) async => tCatalogDTO);
        // act
        final result = await repository.getCatalog();

        late Catalog tResult;
        result.fold((l) => null, (r) {
          tResult = r;
        });
        // assert
        expect(result.isRight(), isTrue);
        expect(tResult, isA<Catalog>());
      },
    );
  });
}
