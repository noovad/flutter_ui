import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimeField extends StatefulWidget {
  final TextEditingController controller;
  const TimeField({
    super.key,
    required this.controller,
  });

  @override
  State<TimeField> createState() => _TimeBoxInputState();
}

class _TimeBoxInputState extends State<TimeField> {
  final hourController = TextEditingController();
  final minuteController = TextEditingController();
  final focusKeyboardHour = FocusNode();
  final focusKeyboardMinute = FocusNode();

  @override
  void didUpdateWidget(TimeField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncFromController();
  }

  void _syncFromController() {
    if (widget.controller.text.isNotEmpty) {
      final parts = widget.controller.text.split(':');
      if (parts.length == 2) {
        hourController.text = parts[0].padLeft(2, '0');
        minuteController.text = parts[1].padLeft(2, '0');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _syncFromController();
    hourController.addListener(_updateMainController);
    minuteController.addListener(_updateMainController);
  }

  void _updateMainController() {
    final hour = hourController.text.padLeft(2, '0');
    final minute = minuteController.text.padLeft(2, '0');
    widget.controller.text = '$hour:$minute';
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
    required TextEditingController controller,
    required FocusNode keyboardFocusNode,
    required String hint,
    required int max,
    required void Function() onUp,
    required void Function() onDown,
    required String align,
  }) {
    return RawKeyboardListener(
      focusNode: keyboardFocusNode,
      onKey: (RawKeyEvent event) {
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            onUp();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            onDown();
          }
        }
      },
      // child: Text('d'),

      child: TextField(
        controller: controller,
        textAlign: align == 'left' ? TextAlign.start : TextAlign.end,
        maxLength: 2,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          isDense: true,
          counterText: '',
          hintText: hint,
        ),
        onChanged: (value) {
          if (value.length == 2) {
            int val = _parse(value, 0, max);
            controller.text = val.toString().padLeft(2, '0');
            controller.selection = TextSelection.fromPosition(
              TextPosition(offset: controller.text.length),
            );
          }
        },
      ),
    );
  }

  Widget _buildTimeFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        Expanded(
          child: _buildField(
            controller: hourController,
            keyboardFocusNode: focusKeyboardHour,
            hint: "HH",
            align: 'right',
            max: 23,
            onUp: () => _adjust(hourController, 1, 0, 23),
            onDown: () => _adjust(hourController, -1, 0, 23),
          ),
        ),
        Text(':', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black)),
        Expanded(
          child: _buildField(
            controller: minuteController,
            keyboardFocusNode: focusKeyboardMinute,
            hint: "MM",
            align: 'left',
            max: 59,
            onUp: () => _adjust(minuteController, 1, 0, 59),
            onDown: () => _adjust(minuteController, -1, 0, 59),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(builder: (context) {
        final hasFocus = Focus.of(context).hasFocus;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: hasFocus
                ? [BoxShadow(color: Colors.red.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4))]
                : [BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(0, 2))],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Time", style: TextStyle(color: Colors.black, fontSize: 12)),
              _buildTimeFields(),
            ],
          ),
        );
      }),
    );
  }
}
