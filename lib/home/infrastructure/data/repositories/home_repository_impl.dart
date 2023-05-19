import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';
import 'package:dartz/dartz.dart';

/// Implementation of the abstract repository class [HomeRepository]
class HomeRepositoryImpl implements HomeRepository {
  /// Constructor
  HomeRepositoryImpl(this._localService);

  final HomeLocalService _localService;

  @override
  Future<Either<Exception, Catalog>> getCatalog() async {
    try {
      final result = await _localService.getLocalCatalog();

      return Right(result.toDomain());
    } on CommonStorageFailure catch (e) {
      return Left(CommonStorageFailure(e.error));
    }
  }
}
