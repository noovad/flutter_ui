import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/appField/app_field.dart';
import 'package:flutter_ui/shared/utils.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';

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
              child: overlayContent(),
            ),
          ),
        ],
      ),
    );
  }

  Material overlayContent() {
    return Material(
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
            final isDayOrMonthChanged = _prevDate != null && (_prevDate!.day != selectedDate.day || _prevDate!.month != selectedDate.month);

            if (isDayOrMonthChanged) {
              _removeOverlay();
            }
            widget.controller.text = ddMmmYyyy(selectedDate);
            widget.controller.selection = TextSelection.fromPosition(
              TextPosition(offset: widget.controller.text.length),
            );

            _prevDate = selectedDate;
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          if (_overlayEntry == null) {
            _overlayEntry = _createOverlayEntry();
            Overlay.of(context).insert(_overlayEntry!);
          }
        }
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: AppField(
          controller: widget.controller,
          label: 'Date',
          hint: 'dd mmm yyyy',
          readOnly: true,
        ),
      ),
    );
  }
}
