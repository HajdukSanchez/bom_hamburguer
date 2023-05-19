import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';
import 'package:bom_hamburguer/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Banner to show discounts based on products list added by user
class CartDiscountsBannerWidget extends StatelessWidget {
  /// Constructor
  const CartDiscountsBannerWidget({
    super.key,
    required this.products,
  });

  /// List of products added to cart to validate
  /// if there is some discount to be applied
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.new,
          data: (data) {
            /// Validate if there is some available discount
            if (data.areDiscountsAvailable(products)) {
              final discount = data.getDiscountRule(products);

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow.shade800,
                ),
                child: RichText(
                  text: TextSpan(
                    text: context.l10n.cartDiscountText1,
                    children: [
                      TextSpan(
                        text: discount.products.toStringItems,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '''${context.l10n.cartDiscountText2}${discount.discount}%''',
                      ),
                    ],
                  ),
                ),
              );
            }

            // If there is no discount available, return an empty widget
            return const SizedBox();
          },
        );
      },
    );
  }
}
