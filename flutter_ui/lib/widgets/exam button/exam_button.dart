import 'package:flutter/material.dart';

class ExamButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ExamButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
