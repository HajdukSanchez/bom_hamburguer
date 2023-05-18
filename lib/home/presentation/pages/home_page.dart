import 'package:bom_hamburguer/home/home.dart';
import 'package:bom_hamburguer/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// Initial page to see catalog, discounts and more
class HomeApp extends StatelessWidget {
  /// Constructor
  const HomeApp({super.key});

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

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.homeAppBarTitle)),
      body: const HomeProvider(
        child: Center(
          child: CatalogListWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showCart,
        heroTag: 1,
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
