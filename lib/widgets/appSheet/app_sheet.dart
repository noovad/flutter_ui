import 'package:flutter/material.dart';

enum SheetSide { left, right }

Future<T?> appSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  SheetSide side = SheetSide.right,
  double? width,
  bool dismissable = true,
  Duration duration = const Duration(milliseconds: 500),
}) {
  final isLeft = side == SheetSide.left;
  final ThemeData parentTheme = Theme.of(context);
  final ColorScheme colorScheme = parentTheme.colorScheme;

  return showGeneralDialog<T>(
    useRootNavigator: false,
    context: context,
    barrierDismissible: dismissable,
    barrierLabel: 'SideSheet',
    transitionDuration: duration,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
        child: Material(
          elevation: 16,
          color: Colors.transparent,
          child: Theme(
            data: parentTheme,
            child: Container(
              width: width ?? MediaQuery.of(context).size.width * 0.4,
              height: double.infinity,
              color: colorScheme.surface,
              child: Builder(builder: builder),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final offset = Tween<Offset>(
        begin: Offset(isLeft ? -1.0 : 1.0, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ));
      return SlideTransition(position: offset, child: child);
    },
  );
}
