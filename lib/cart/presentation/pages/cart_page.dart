import 'package:bom_hamburguer/cart/cart.dart';
import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cart page when user see all products added to cart
class CartPage extends StatelessWidget {
  /// Constructor
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => state.maybeWhen(
          orElse: SizedBox.new,
          initial: () => const EmptyCartWidget(),
          cart: (cart, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Visibility(
              visible: cart.products.isNotEmpty,
              replacement: const EmptyCartWidget(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = cart.products[index];

                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(product.name),
                            subtitle: Text(product.formattedPrice),
                            trailing: TextButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartEvent.remove(product: product));
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red.shade400,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  CartDiscountsBannerWidget(
                    products: cart.products,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        context.l10n.cartTotal,
                        style: textTheme.headline6!.copyWith(),
                      ),
                      trailing: Text(
                        cart.totalAmount,
                        style: textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ButtonWidget(
                    buttonText: context.l10n.cartCheckout,
                    onTap: () async {
                      await Navigator.of(context).push<void>(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const CheckOutPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
