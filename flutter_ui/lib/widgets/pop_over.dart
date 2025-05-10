import 'package:flutter/material.dart';

class Popover extends StatefulWidget {
  final Widget child;
  final Widget content;
  final Duration showDelay;
  final EdgeInsets padding;
  final double elevation;

  const Popover({
    super.key,
    required this.child,
    required this.content,
    this.showDelay = const Duration(milliseconds: 100),
    this.padding = const EdgeInsets.all(8),
    this.elevation = 6,
  });

  @override
  State<Popover> createState() => _PopoverState();
}

class _PopoverState extends State<Popover> {
  final MenuController _controller = MenuController();
  bool _hovering = false;

  void _openPopover() {
    Future.delayed(widget.showDelay, () {
      if (mounted && _hovering) _controller.open();
    });
  }

  void _closePopover() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted && !_hovering) _controller.close();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      controller: _controller,
      alignmentOffset: Offset.zero,
      menuChildren: [
        MouseRegion(
          onEnter: (_) {
            _hovering = true;
          },
          onExit: (_) {
            _hovering = false;
            _closePopover();
          },
          child: Material(
            elevation: widget.elevation,
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: widget.padding,
              child: widget.content,
            ),
          ),
        ),
      ],
      builder: (context, controller, child) {
        return MouseRegion(
          onEnter: (_) {
            _hovering = true;
            _openPopover();
          },
          onExit: (_) {
            _hovering = false;
            _closePopover();
          },
          child: widget.child,
        );
      },
    );
  }
}
