import 'package:bom_hamburguer/home/home.dart';
import 'package:dartz/dartz.dart';

/// Contract repository for Home
// ignore: one_member_abstracts
abstract class HomeRepository {
  /// Get initial catalog
  Future<Either<Exception, Catalog>> getCatalog();
}
