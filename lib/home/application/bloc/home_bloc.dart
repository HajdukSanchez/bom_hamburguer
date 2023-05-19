import 'package:bloc/bloc.dart';
import 'package:bom_hamburguer/home/home.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

/// Bloc with logic business for the home feature
///
/// Like get initial catalog with products and discounts
@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// Constructor
  HomeBloc(this._useCase) : super(const _Initial()) {
    /// Map events
    on<HomeEvent>(
      (event, emit) => event.when(
        getCatalog: () => _getCatalog(event, emit),
      ),
    );
  }

  final GetHomeCatalogUseCase _useCase;

  // Get initial catalog data
  Future<void> _getCatalog(HomeEvent event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());

    final result = await _useCase.execute();
    emit(
      result.fold(
        HomeState.error,
        (catalog) => HomeState.data(data: catalog),
      ),
    );
  }
}
