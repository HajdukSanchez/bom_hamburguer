import 'package:bom_hamburguer/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// List with catalog of products
class CatalogListWidget extends StatefulWidget {
  /// Constructor
  const CatalogListWidget({super.key});

  @override
  State<CatalogListWidget> createState() => _CatalogListWidgetState();
}

class _CatalogListWidgetState extends State<CatalogListWidget> {
  @override
  void initState() {
    _getCatalogData();
    super.initState();
  }

  // Get data for the catalog
  void _getCatalogData() {
    context.read<HomeBloc>().add(const HomeEvent.getCatalog());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          loading: CircularProgressIndicator.new,
          data: (data) => RefreshIndicator(
            onRefresh: () async => _getCatalogData(),
            child: ListView.builder(
              itemCount: data.products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = data.products[index];

                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('\$${product.price}'),
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      product.image,
                      errorBuilder: (_, __, ___) => const Icon(Icons.error),
                    ),
                  ),
                  trailing: IconButton(
                    splashRadius: 20,
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      // TODO: ADD Addtion to cart
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
