import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final double? height;
  const AppCard({
    super.key,
    required this.child,
    this.color = const Color(0xFF27272A),
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: child,
      ),
    );
  }
}
