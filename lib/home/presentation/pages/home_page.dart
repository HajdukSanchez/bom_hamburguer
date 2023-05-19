import 'package:bom_hamburguer/home/home.dart';
import 'package:bom_hamburguer/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// Initial page to see catalog, discounts and more
class HomeApp extends StatelessWidget {
  /// Constructor
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.homeAppBarTitle)),
      body: const Center(
        child: CatalogListWidget(),
      ),
      floatingActionButton: const CartButtonWidget(),
    );
  }
}
