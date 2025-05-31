// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? hint;
  final bool readOnly;
  final bool? enabled;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool obscureText;
  final int? minLines;
  final int? maxLines;
  final String? errorText;
  final Widget? child;
  final String? initialValue;
  final bool? isRequired;

  const AppTextField({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    this.hint = '',
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.obscureText = false,
    this.minLines,
    this.maxLines,
    this.errorText,
    this.child,
    this.initialValue,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseTextStyle = Theme.of(context).textTheme.bodyLarge;
    final errorTextStyle = TextStyle(
      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
      color: colorScheme.error,
    );
    return Focus(
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.withOpacity(0.25)),
              boxShadow: hasFocus
                  ? [
                      BoxShadow(
                          color: colorScheme.tertiary.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 4))
                    ]
                  : [
                      BoxShadow(
                          color: colorScheme.shadow.withOpacity(0.3),
                          blurRadius: 4,
                          spreadRadius: 0.3,
                          offset: const Offset(0, 4))
                    ],
            ),
            child: child != null
                ? child!
                : TextFormField(
                    controller: controller,
                    initialValue: initialValue,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: baseTextStyle,
                    readOnly: readOnly,
                    minLines: minLines,
                    maxLines: maxLines,
                    enabled: enabled,
                    obscureText: obscureText,
                    onTap: onTap,
                    decoration: InputDecoration(
                      errorText: errorText,
                      label: Row(children: [
                        Text(label),
                        Visibility(
                          visible: isRequired!,
                          child: Text(
                            ' *',
                            style: TextStyle(color: colorScheme.error),
                          ),
                        )
                      ]),
                      hintText: hint,
                      hintStyle: baseTextStyle,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      errorStyle: errorTextStyle,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    onChanged: onChanged,
                  ),
          );
        },
      ),
    );
  }
}
