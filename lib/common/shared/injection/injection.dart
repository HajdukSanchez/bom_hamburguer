import 'package:bom_hamburguer/home/home.dart';
import 'package:bom_hamburguer/payment/payment.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

// Get it for dependency injection instance
final getIt = GetIt.instance;

Future<void> initDI() async {
  getIt
    ..registerLazySingleton<FlutterSecureStorage>(
      FlutterSecureStorage.new,
    )
    ..registerLazySingleton<HomeLocalService>(
      () => HomeLocalServiceImpl(
        getIt<FlutterSecureStorage>(),
      ),
    )
    ..registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<GetHomeCatalogUseCase>(
      () => GetHomeCatalogUseCase(getIt()),
    )
    ..registerLazySingleton<PaymentRemoteService>(
      PaymentRemoteServiceImpl.new,
    )
    ..registerLazySingleton<PaymentRepository>(
      () => PaymentRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<PaymentUseCase>(
      () => PaymentUseCase(getIt()),
    )
    ..registerLazySingleton<HomeBloc>(
      () => HomeBloc(getIt()),
    )
    ..registerLazySingleton<PaymentOrderBloc>(
      () => PaymentOrderBloc(getIt()),
    );
}
