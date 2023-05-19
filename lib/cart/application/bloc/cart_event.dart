part of 'cart_bloc.dart';

/// Events to handle cart behavior
@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.add({required Product product}) = _Add;
}
