import 'package:bom_hamburguer/common/shared/injection/injection.config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Get it for dependency injection instance
final getIt = GetIt.instance;

/// initializes the registration of provided dependencies inside of [GetIt]
@injectableInit
void configureInjection() {
  $initGetIt(getIt);
}

/// Module for inject external dependencies
@module
abstract class InjectableModule {
  @singleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();
}
