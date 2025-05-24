import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/utils.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';

class AppDateField extends StatefulWidget {
  final DateTime? initialValue;
  final DateTime? initialDate;
  final Function(DateTime)? onChanged;
  final String label;
  final String? hint;
  final bool readOnly;

  const AppDateField({
    super.key,
    this.initialValue,
    this.initialDate,
    this.onChanged,
    this.label = 'Date',
    this.hint = 'dd mmm yyyy',
    this.readOnly = true,
  });

  @override
  State<AppDateField> createState() => _AppDateFieldState();
}

class _AppDateFieldState extends State<AppDateField> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late DateTime _selectedDate;
  late TextEditingController _textController;

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialValue ?? DateTime.now();
    _textController = TextEditingController(
      text: widget.initialValue != null ? ddMmmYyyy(_selectedDate) : '',
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    _textController.dispose();
    super.dispose();
  }

  void _showCalendarOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;

      _overlayEntry = OverlayEntry(
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
                  child: CalendarDatePicker(
                    initialDate: widget.initialDate ?? _selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    onDateChanged: (selectedDate) {
                      setState(() {
                        _selectedDate = selectedDate;
                        _textController.text = ddMmmYyyy(selectedDate);
                      });

                      if (widget.onChanged != null) {
                        widget.onChanged!(selectedDate);
                      }

                      _removeOverlay();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: AppTextField(
        controller: _textController,
        label: widget.label,
        hint: widget.hint,
        readOnly: true,
        onTap: () => _showCalendarOverlay(context),
        onChanged: (value) {
          widget.onChanged
              ?.call(value.isNotEmpty ? DateTime.parse(value) : DateTime.now());
        },
      ),
    );
  }
}
