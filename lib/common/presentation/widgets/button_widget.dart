import 'package:flutter/material.dart';

/// Common button widget
class ButtonWidget extends StatelessWidget {
  /// Constructor
  const ButtonWidget({
    super.key,
    required this.buttonText,
    this.onTap,
  });

  /// Text to be displayed
  final String buttonText;

  /// Function to be called when button is pressed
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: textTheme.headline6!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
