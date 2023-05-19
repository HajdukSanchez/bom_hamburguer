import 'package:flutter/material.dart';

/// Button used to go back in some specific page
class BackButtonWidget extends StatelessWidget {
  /// Constructor
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          Icons.chevron_left_outlined,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}
