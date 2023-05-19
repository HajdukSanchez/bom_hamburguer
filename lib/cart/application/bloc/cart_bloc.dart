import 'package:bloc/bloc.dart';
import 'package:bom_hamburguer/cart/cart.dart';
import 'package:bom_hamburguer/common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

/// Bloc to handle cart behavior
class CartBloc extends Bloc<CartEvent, CartState> {
  /// Constructor
  CartBloc() : super(const _Initial()) {
    on<CartEvent>(
      (event, emit) {
        event.when(
          add: (product) => _addNewProduct(event, emit, product: product),
          remove: (product) => _deleteProduct(event, emit, product: product),
        );
      },
    );
  }

  /// Cart state
  Cart cart = const Cart(products: []);

  // Set new product to cart
  Future<void> _addNewProduct(
    CartEvent event,
    Emitter<CartState> emit, {
    required Product product,
  }) async {
    final productExist =
        cart.products.any((element) => element.id == product.id);

    if (productExist) {
      emit(CartState.cart(cart: cart, isError: true));
      emit(CartState.cart(cart: cart, isError: false));
    } else {
      cart = cart.copyWith(products: [...cart.products, product]);
      emit(CartState.cart(cart: cart, isError: false));
    }
  }

  // Delete existing product from cart
  Future<void> _deleteProduct(
    CartEvent event,
    Emitter<CartState> emit, {
    required Product product,
  }) async {
    final newProducts =
        cart.products.where((element) => element.id != product.id).toList();

    cart = cart.copyWith(products: newProducts);
    emit(CartState.cart(cart: cart, isError: false));
  }
}
