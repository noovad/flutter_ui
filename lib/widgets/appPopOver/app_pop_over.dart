import 'package:flutter/material.dart';

class AppPopOver extends StatefulWidget {
  final Widget trigger;
  final Widget content;
  final Duration showDelay;

  const AppPopOver({
    super.key,
    required this.trigger,
    required this.content,
    this.showDelay = const Duration(milliseconds: 100),
  });

  @override
  State<AppPopOver> createState() => _AppPopOverState();
}

class _AppPopOverState extends State<AppPopOver> {
  final MenuController _controller = MenuController();
  bool _hovering = false;

  void _openAppPopOver() {
    Future.delayed(widget.showDelay, () {
      if (mounted && _hovering) _controller.open();
    });
  }

  void _closeAppPopOver() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted && !_hovering) _controller.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: _controller,
      alignmentOffset: Offset(0, 8),
      menuChildren: [
        MouseRegion(
          onEnter: (_) {
            _hovering = true;
          },
          onExit: (_) {
            _hovering = false;
            _closeAppPopOver();
          },
          child: widget.content,
        ),
      ],
      builder: (context, controller, child) {
        return MouseRegion(
          onEnter: (_) {
            _hovering = true;
            _openAppPopOver();
          },
          onExit: (_) {
            _hovering = false;
            _closeAppPopOver();
          },
          child: widget.trigger,
        );
      },
    );
  }
}
