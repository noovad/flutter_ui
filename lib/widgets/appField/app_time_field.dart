import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/shared/color/app_colors.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';

class AppTimeField extends StatefulWidget {
  final String? initialValue;
  final String? label;
  final String? hintHour;
  final String? hintMinute;
  final Function(String)? onChanged;
  final String? errorText;
  final bool enabled;

  const AppTimeField({
    super.key,
    this.initialValue,
    this.label,
    this.hintHour,
    this.hintMinute,
    this.onChanged,
    this.errorText,
    this.enabled = true,
  });

  @override
  State<AppTimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<AppTimeField> {
  final controller = TextEditingController();
  final hourController = TextEditingController();
  final minuteController = TextEditingController();
  final focusKeyboardHour = FocusNode();
  final focusKeyboardMinute = FocusNode();

  @override
  void initState() {
    super.initState();
    _syncFromController();
    hourController.addListener(_updateMainController);
    minuteController.addListener(_updateMainController);
  }

  void _syncFromController() {
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
      final parts = controller.text.split(':');
      if (parts.length == 2) {
        hourController.text = parts[0].padLeft(2, '0');
        minuteController.text = parts[1].padLeft(2, '0');
      }
    }
  }

  void _updateMainController() {
    final hour = hourController.text.padLeft(2, '0');
    final minute = minuteController.text.padLeft(2, '0');
    controller.text = '$hour:$minute';
  }

  int _parse(String value, int min, int max) {
    final intVal = int.tryParse(value) ?? 0;
    if (intVal < min) return min;
    if (intVal > max) return max;
    return intVal;
  }

  void _adjust(TextEditingController ctrl, int step, int min, int max) {
    int curr = _parse(ctrl.text, min, max);
    int newVal = (curr + step).clamp(min, max);
    ctrl.text = newVal.toString().padLeft(2, '0');
    ctrl.selection = TextSelection.fromPosition(
      TextPosition(offset: ctrl.text.length),
    );
  }

  @override
  void dispose() {
    hourController.dispose();
    minuteController.dispose();
    focusKeyboardHour.dispose();
    focusKeyboardMinute.dispose();
    super.dispose();
  }

  Widget _buildField({
    required Function(String)? onChanged,
    required TextEditingController controller,
    required FocusNode keyboardFocusNode,
    required String hint,
    required int max,
    required void Function() onUp,
    required void Function() onDown,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return KeyboardListener(
      focusNode: keyboardFocusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            onUp();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            onDown();
          }
        }
      },
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        maxLength: 2,
        enabled: widget.enabled,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: colorScheme
              .onSurface, // Use colorScheme instead of AppTheme.charcoal
        ),
        decoration: InputDecoration(
          isDense: true,
          counterText: '',
          hintText: hint,
          hintStyle: TextStyle(color: AppColor.mediumGrey),
        ),
        onChanged: (value) {
          if (value.length == 2) {
            int val = _parse(value, 0, max);
            controller.text = val.toString().padLeft(2, '0');
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length),
            );
          }
          if (onChanged != null) {
            onChanged(value);
          }
        },
      ),
    );
  }

  Widget _buildTimeSegmentField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String hint,
    required int maxValue,
  }) {
    return SizedBox(
      width: 40,
      child: _buildField(
        controller: controller,
        keyboardFocusNode: focusNode,
        hint: hint,
        max: maxValue,
        onUp: () => _adjust(controller, 1, 0, maxValue),
        onDown: () => _adjust(controller, -1, 0, maxValue),
        onChanged: (value) {
          if (widget.onChanged != null) {
            widget.onChanged!(this.controller.text);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: widget.label ?? "Time",
      errorText: widget.errorText,
      enabled: widget.enabled,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Time",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hour field
              _buildTimeSegmentField(
                controller: hourController,
                focusNode: focusKeyboardHour,
                hint: widget.hintHour ?? "HH",
                maxValue: 23,
              ),

              Text(
                ':',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              // Minute field
              _buildTimeSegmentField(
                controller: minuteController,
                focusNode: focusKeyboardMinute,
                hint: widget.hintMinute ?? "MM",
                maxValue: 59,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
