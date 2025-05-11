import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Widget buildFormRow({
  required String label,
  required ShadThemeData theme,
  required Widget child,
}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          label,
          style: theme.textTheme.small,
        ),
      ),
      Text(":"),
      Expanded(
        flex: 5,
        child: child,
      ),
    ],
  );
}
