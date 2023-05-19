import 'dart:convert';

import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Remote data source to handle Home requests
// ignore: one_member_abstracts
abstract class HomeLocalService {
  Future<CatalogDTO> getLocalCatalog();
}

/// Implementation of [HomeLocalService]
@Injectable(as: HomeLocalService)
class HomeLocalServiceImpl extends HomeLocalService {
  /// Constructor
  HomeLocalServiceImpl(this._storage);

  final FlutterSecureStorage _storage;

  @override
  Future<CatalogDTO> getLocalCatalog() async {
    try {
      // Read value
      final value = await _storage.read(key: HomeDataConst.catalogKey.value);

      if (value != null) {
        final valueJson = jsonDecode(value);

        return Future.delayed(
          const Duration(seconds: 2),
          () {
            return CatalogDTO.fromJson(valueJson as Map<String, dynamic>);
          },
        );
      }

      throw CommonStorageFailure('Error reading catalog from storage');
    } catch (e) {
      throw CommonStorageFailure(e.toString());
    }
  }
}
