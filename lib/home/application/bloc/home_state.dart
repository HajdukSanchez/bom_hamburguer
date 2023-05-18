part of 'home_bloc.dart';

/// States for the [HomeBloc] provider
@freezed
class HomeState with _$HomeState {
  /// Initial state
  const factory HomeState.initial() = _Initial;

  /// Loading data state
  const factory HomeState.loading() = _Loading;

  /// Data loaded state
  const factory HomeState.data({required Catalog data}) = _Data;

  /// Error getting data state
  const factory HomeState.error(Exception error) = _Error;
}
