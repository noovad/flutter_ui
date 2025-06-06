import 'package:flutter/material.dart';

enum buttonType { icon, iconOnly }

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final IconData? icon;
  final bool background;

  const AppButton.icon({
    super.key,
    required this.onPressed,
    required this.icon,
  }) : background = true;

  const AppButton.iconOnly({
    super.key,
    required this.onPressed,
    required this.icon,
  }) : background = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: background
          ? ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary,
              ),
            )
          : null,
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 18,
        color: background
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
