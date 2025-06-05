import 'package:flutter/material.dart';

enum buttonType { icon }

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;

  const AppButton.icon({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
