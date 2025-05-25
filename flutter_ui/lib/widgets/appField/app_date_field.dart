import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/utils.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';

class AppDateField extends StatefulWidget {
  final DateTime? initialValue;
  final DateTime? initialDate;
  final Function(DateTime)? onChanged;
  final String label;
  final String? hint;
  final String? errorText;
  final bool enabled;

  const AppDateField({
    super.key,
    this.initialValue,
    this.initialDate,
    this.onChanged,
    this.label = 'Date',
    this.hint = '01 Jan 1999',
    this.enabled = true,
    this.errorText,
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
    _selectedDate = widget.initialValue ?? widget.initialDate ?? DateTime.now();
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
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.white,
                  child: CalendarDatePicker(
                    initialDate: _selectedDate,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2050),
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
        enabled: widget.enabled,
        label: widget.label,
        hint: widget.hint,
        readOnly: true,
        onTap: () => _showCalendarOverlay(context),
        errorText: widget.errorText,
      ),
    );
  }
}
