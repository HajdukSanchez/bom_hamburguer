import 'package:bom_hamburguer/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// Information to show to user when cart is empty
class EmptyCartWidget extends StatelessWidget {
  /// Constructor
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          Icons.add_shopping_cart_outlined,
          size: 100,
          color: Colors.grey.shade500,
        ),
        const SizedBox(height: 10),
        Text(
          context.l10n.cartEmpty,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.grey.shade500,
              ),
        ),
      ],
    );
  }
}
