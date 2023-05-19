import 'package:bom_hamburguer/cart/cart.dart';
import 'package:bom_hamburguer/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cart button with number of items and navigation to cart page
class CartButtonWidget extends StatelessWidget {
  /// Constructor
  const CartButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to cart page
    Future<void> showCart() async {
      // await Navigator.of(context).push<void>(
      //   MaterialPageRoute<void>(
      //     builder: (BuildContext context) => const TODO,
      //   ),
      // );
    }

    return Stack(
      children: [
        FloatingActionButton(
          onPressed: showCart,
          heroTag: 1,
          child: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
        ),
        BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              cart: (_, isError) {
                if (isError) {
                  // Show warning message if there is an
                  // error adding the product
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Text(context.l10n.cartProductAlreadyAdded),
                        backgroundColor: Colors.red,
                      ),
                    );
                }
              },
            );
          },
          builder: (_, state) {
            return state.maybeWhen(
              orElse: SizedBox.new,
              cart: (cart, _) => Visibility(
                visible: cart.products.isNotEmpty,
                child: Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      cart.products.length.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
