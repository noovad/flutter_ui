import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final bool? withLabel;
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
  final String? prefixText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Icon? suffixIcon;

  const AppTextField({
    super.key,
    this.label,
    this.withLabel = true,
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
    this.prefixText,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final baseTextStyle = Theme.of(context).textTheme.bodyLarge;
    final errorTextStyle = TextStyle(
      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
      color: colorScheme.error,
    );

    final verticalPadding = withLabel == false ? 8.0 : 12.0;

    return Focus(
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding:
                EdgeInsets.symmetric(horizontal: 16, vertical: verticalPadding),
            constraints: BoxConstraints(
              minHeight: withLabel == false ? 36.0 : 48.0,
            ),
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
                          color: colorScheme.shadow.withOpacity(0.5),
                          blurRadius: 4,
                          spreadRadius: 0.3,
                          offset: const Offset(0, 4))
                    ],
            ),
            child: child != null
                ? child!
                : TextFormField(
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
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
                      prefixText: prefixText,
                      label: withLabel == false
                          ? null
                          : Row(children: [
                              Text(label ?? '',
                                  style:
                                      TextStyle(color: colorScheme.onSurface)),
                              Visibility(
                                visible: isRequired!,
                                child: Text(
                                  ' *',
                                  style: TextStyle(color: colorScheme.error),
                                ),
                              )
                            ]),
                      hintText: hint,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      isDense: true,
                      contentPadding: withLabel == false
                          ? EdgeInsets.symmetric(
                              vertical: 4)
                          : (suffixIcon != null
                              ? EdgeInsets.only(right: 40.0)
                              : EdgeInsets.zero),
                      errorStyle: errorTextStyle,
                      isCollapsed: withLabel == false,
                      suffixIcon: suffixIcon != null
                          ? Container(
                              margin: const EdgeInsets.only(right: 8.0),
                              alignment: Alignment.center,
                              width: 24,
                              height: 24,
                              child: suffixIcon,
                            )
                          : null,
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
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
