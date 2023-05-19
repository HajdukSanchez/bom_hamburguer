import 'package:bom_hamburguer/cart/cart.dart';
import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/l10n/l10n.dart';
import 'package:bom_hamburguer/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Page when user handle his data to perform a checkout
class CheckOutPage extends StatefulWidget {
  /// Constructor
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          cart: (cart, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Text(
                      '${context.l10n.checkoutPay} ${cart.totalAmount}',
                      style: textTheme.headline3,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      context.l10n.checkoutPersonalData,
                      style: textTheme.headline6,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: context.l10n.textFieldName,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: _controller,
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: BlocBuilder<PaymentOrderBloc, PaymentOrderState>(
                      builder: (context, state) => state.maybeWhen(
                        orElse: SizedBox.new,
                        loading: CircularProgressIndicator.new,
                        data: (isSuccessfully) => Icon(
                          isSuccessfully
                              ? Icons.check_circle_outline_rounded
                              : Icons.error_outline_rounded,
                          color: isSuccessfully ? Colors.green : Colors.red,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                ButtonWidget(
                  buttonText: context.l10n.checkoutButtonPay,
                  onTap: () async {
                    final user = User(name: _controller.text);
                    final order = Order(cart: cart, user: user);

                    context.read<PaymentOrderBloc>().add(
                          PaymentOrderEvent.pay(order: order),
                        );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
