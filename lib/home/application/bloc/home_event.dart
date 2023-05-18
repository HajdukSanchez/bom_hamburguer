part of 'home_bloc.dart';

/// Events for the [HomeBloc] provider
@freezed
class HomeEvent with _$HomeEvent {
  /// Get catalog data
  const factory HomeEvent.getCatalog() = _GetCatalog;
}
