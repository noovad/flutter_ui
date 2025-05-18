import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/utils.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:intl/intl.dart';

class DateField extends StatefulWidget {
  final TextEditingController controller;

  const DateField({super.key, required this.controller});

  @override
  State<DateField> createState() => _CalendarFieldState();
}

class _CalendarFieldState extends State<DateField> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  DateTime? _prevDate;

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _removeOverlay();
              },
            ),
          ),
          Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              offset: Offset(0, size.height + 8),
              child: Material(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: Colors.white,
                child: Theme(
                  data: appThemeData(),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2024),
                    lastDate: DateTime(DateTime.now().year + 1),
                    onDateChanged: (selectedDate) {
                      final isDayOrMonthChanged =
                          _prevDate != null && (_prevDate!.day != selectedDate.day || _prevDate!.month != selectedDate.month);

                      if (isDayOrMonthChanged) {
                        _removeOverlay();
                      }
                      debugPrint("Selected Date: $selectedDate");

                      widget.controller.text = DateFormat('dd MMMM yyyy').format(selectedDate);
                      widget.controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.controller.text.length),
                      );

                      _prevDate = selectedDate;
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = Theme.of(context).textTheme.bodyLarge;
    final errorTextStyle = TextStyle(
      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
      color: Colors.red,
    );
    return Focus(onFocusChange: (hasFocus) {
      if (hasFocus) {
        if (_overlayEntry == null) {
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context).insert(_overlayEntry!);
        }
      }
    }, child: Builder(builder: (context) {
      final hasFocus = Focus.of(context).hasFocus;
      return CompositedTransformTarget(
        link: _layerLink,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: hasFocus
                ? [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    )
                  ],
          ),
          child: TextFormField(
            controller: widget.controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: baseTextStyle,
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Date",
              hintText: 'Select Data',
              hintStyle: baseTextStyle?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              errorStyle: errorTextStyle,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }));
  }
}
