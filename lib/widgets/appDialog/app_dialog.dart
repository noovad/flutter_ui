import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final Widget trigger;
  final Widget content;

  const AppDialog({
    super.key,
    required this.trigger,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _showDialog(context),
        child: trigger,
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: content,
        );
      },
    );
  }
}
