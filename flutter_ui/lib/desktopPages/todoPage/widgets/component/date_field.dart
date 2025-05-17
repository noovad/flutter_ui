import 'package:flutter/material.dart';

class DateField extends StatefulWidget {
  final TextEditingController controller;

  const DateField({super.key, required this.controller});

  @override
  State<DateField> createState() => _CalendarFieldState();
}

class _CalendarFieldState extends State<DateField> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showCalendarOverlay();
      } else {
        _removeOverlay();
      }
    });
  }

  void _showCalendarOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0.0, size.height + 4.0),
          showWhenUnlinked: false,
          child: Material(
            elevation: 4.0,
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              onDateChanged: (selectedDate) {
                widget.controller.text =
                    "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                _focusNode.unfocus();
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        readOnly: true,
        decoration: const InputDecoration(
          labelText: 'Select Date',
          suffixIcon: Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}
