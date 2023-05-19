part of 'cart_bloc.dart';

/// State for the cart behavior
@freezed
class CartState with _$CartState {
  /// Initial cart state
  const factory CartState.initial() = _Initial;

  /// List of products in the cart
  const factory CartState.cart({
    required Cart cart,
    required bool isError,
  }) = _Cart;
}
