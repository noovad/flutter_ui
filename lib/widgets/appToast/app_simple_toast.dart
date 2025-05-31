import 'package:flutter/material.dart';

enum ToastPosition {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

class AppSimpleToast {
  static void show(
    BuildContext context, {
    required Widget child,
    ToastPosition position = ToastPosition.bottomCenter,
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    double verticalOffset = 25,
    double horizontalOffset = 25,
  }) {
    final overlay = Overlay.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    backgroundColor ??= colorScheme.inverseSurface;

    Alignment alignment = _getAlignment(position);
    EdgeInsets margin = _getMargin(position, verticalOffset, horizontalOffset);

    final overlayEntry = OverlayEntry(
      builder: (context) => SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: Align(
                  alignment: alignment,
                  child: Container(
                    margin: margin,
                    child: ToastContainer(
                      backgroundColor: backgroundColor!,
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(duration).then((_) => overlayEntry.remove());
  }

  static Alignment _getAlignment(ToastPosition position) {
    switch (position) {
      case ToastPosition.topLeft:
        return Alignment.topLeft;
      case ToastPosition.topCenter:
        return Alignment.topCenter;
      case ToastPosition.topRight:
        return Alignment.topRight;
      case ToastPosition.bottomLeft:
        return Alignment.bottomLeft;
      case ToastPosition.bottomCenter:
        return Alignment.bottomCenter;
      case ToastPosition.bottomRight:
        return Alignment.bottomRight;
    }
  }

  static EdgeInsets _getMargin(
    ToastPosition position,
    double verticalOffset,
    double horizontalOffset,
  ) {
    switch (position) {
      case ToastPosition.topLeft:
        return EdgeInsets.only(top: verticalOffset, left: horizontalOffset);
      case ToastPosition.topCenter:
        return EdgeInsets.only(top: verticalOffset);
      case ToastPosition.topRight:
        return EdgeInsets.only(top: verticalOffset, right: horizontalOffset);
      case ToastPosition.bottomLeft:
        return EdgeInsets.only(bottom: verticalOffset, left: horizontalOffset);
      case ToastPosition.bottomCenter:
        return EdgeInsets.only(bottom: verticalOffset);
      case ToastPosition.bottomRight:
        return EdgeInsets.only(bottom: verticalOffset, right: horizontalOffset);
    }
  }
}

class ToastContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const ToastContainer({
    super.key,
    required this.child,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: Offset.zero,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow,
                blurRadius: 10,
                offset: const Offset(0.5, 1),
              ),
            ],
          ),
          child: DefaultTextStyle(
            style: TextStyle(color: colorScheme.onInverseSurface),
            child: child,
          ),
        ),
      ),
    );
  }
}
