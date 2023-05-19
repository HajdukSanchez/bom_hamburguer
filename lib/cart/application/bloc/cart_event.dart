part of 'cart_bloc.dart';

/// Events to handle cart behavior
@freezed
class CartEvent with _$CartEvent {
  /// Event when user add a new product to cart
  const factory CartEvent.add({required Product product}) = _Add;

  /// Event when user remove a product from cart
  const factory CartEvent.remove({required Product product}) = _Remove;

  /// Event to add a discount when there is some one
  const factory CartEvent.addDiscount({required DiscountRule discount}) =
      _AddDiscount;
}
