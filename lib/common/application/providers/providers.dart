import 'package:bom_hamburguer/cart/cart.dart';
import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';
import 'package:bom_hamburguer/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Common provider for App Features
class CommonProvider extends StatefulWidget {
  /// Constructor
  const CommonProvider({
    super.key,
    required this.child,
  });

  /// Child to surround into providers
  final Widget child;

  @override
  State<CommonProvider> createState() => _CommonProviderState();
}

class _CommonProviderState extends State<CommonProvider> {
  @override
  void initState() {
    // Save local data to be consumed by the app
    Future.microtask(saveUserData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => getIt<HomeBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
        BlocProvider<PaymentOrderBloc>(
          create: (BuildContext context) => getIt<PaymentOrderBloc>(),
        ),
      ],
      child: widget.child,
    );
  }
}
