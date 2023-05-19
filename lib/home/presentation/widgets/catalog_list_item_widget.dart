import 'package:bom_hamburguer/cart/cart.dart';
import 'package:bom_hamburguer/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// List item widget to render on the main catalog list
class CatalogListItemWidget extends StatelessWidget {
  /// Constructor
  const CatalogListItemWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    const imageBoxSize = 70.0;

    // Add product into the cart
    void addProduct() {
      context.read<CartBloc>().add(CartEvent.add(product: product));
    }

    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.formattedPrice),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: const BoxConstraints(
          maxWidth: imageBoxSize,
          maxHeight: imageBoxSize,
          minHeight: imageBoxSize,
          minWidth: imageBoxSize,
        ),
        child: Image.network(
          product.image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(Icons.error),
        ),
      ),
      trailing: IconButton(
        splashRadius: 20,
        icon: const Icon(Icons.add),
        onPressed: addProduct,
      ),
    );
  }
}
