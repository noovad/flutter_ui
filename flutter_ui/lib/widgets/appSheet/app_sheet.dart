import 'package:flutter/material.dart';

enum SheetSide { left, right }

Future<T?> appSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  SheetSide side = SheetSide.right,
  double? width,
  Duration duration = const Duration(milliseconds: 500),
}) {
  final isLeft = side == SheetSide.left;
  final ThemeData parentTheme = Theme.of(context);

  return showGeneralDialog<T>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'SideSheet',
    barrierColor: Colors.black45,
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
              color: parentTheme.canvasColor,
              child: Column(
                children: [
                  Align(
                    alignment: isLeft ? Alignment.centerRight : Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(child: Builder(builder: builder)),
                ],
              ),
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
