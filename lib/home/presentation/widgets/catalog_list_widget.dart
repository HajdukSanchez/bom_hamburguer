import 'package:bom_hamburguer/home/home.dart';
import 'package:bom_hamburguer/l10n/l10n.dart';
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

  // Text to show on List title section
  Widget getListTitleText(String text) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) => state.maybeWhen(
        orElse: SizedBox.new,
        loading: CircularProgressIndicator.new,
        data: (data) => RefreshIndicator(
          onRefresh: () async => _getCatalogData(),
          child: ListView(
            children: [
              // Only show extra products if there is any main product
              Visibility(
                visible: data.areMainProductsAvailable,
                replacement: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 150,
                    horizontal: 20,
                  ),
                  child: Text(
                    context.l10n.homeNoMainProducts,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getListTitleText(context.l10n.homeListMainProductsTitle),
                    ...data.mainProducts.map(
                      (e) => CatalogListItemWidget(product: e),
                    ),
                    Visibility(
                      visible: data.areAdditionProductsAvailable,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getListTitleText(
                            context.l10n.homeListAdditionProductsTitle,
                          ),
                          ...data.additionProducts.map(
                            (e) => CatalogListItemWidget(product: e),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
