import 'package:bom_hamburguer/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Bloc provider for Home Feature
class HomeProvider extends StatelessWidget {
  /// Constructor
  const HomeProvider({
    super.key,
    required this.child,
  });

  /// Child to surround into providers
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (BuildContext context) => HomeBloc()),
      ],
      child: child,
    );
  }
}
