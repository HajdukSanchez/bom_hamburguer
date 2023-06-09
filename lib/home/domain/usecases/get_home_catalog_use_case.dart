import 'package:bom_hamburguer/home/home.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Use case to get the home catalog
@injectable
class GetHomeCatalogUseCase {
  /// Constructor
  GetHomeCatalogUseCase(this._repository);

  final HomeRepository _repository;

  /// Execution of the use case
  Future<Either<Exception, Catalog>> execute() async {
    return _repository.getCatalog();
  }
}
