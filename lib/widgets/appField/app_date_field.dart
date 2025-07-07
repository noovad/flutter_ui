import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_spaces.dart';
import 'package:flutter_ui/shared/utils.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';

class AppDateField extends StatefulWidget {
  final DateTime? initialValue;
  final DateTime? initialDate;
  final Function(DateTime)? onChanged;
  final String label;
  final String? hint;
  final String? errorText;
  final bool? isRequired;
  final bool? enabled;
  final bool showTodayButton;

  const AppDateField({
    super.key,
    this.initialValue,
    this.initialDate,
    this.onChanged,
    this.label = 'Date',
    this.hint = '01 Jan 1999',
    this.errorText,
    this.isRequired = false,
    this.enabled,
    this.showTodayButton = false,
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
  void didUpdateWidget(covariant AppDateField oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newValue = widget.initialValue;
    if (newValue != null && newValue != _selectedDate) {
      setState(() {
        _selectedDate = newValue;
        _textController.text = ddMmmYyyy(newValue);
      });
    }
  }

  @override
  void dispose() {
    _removeOverlay();
    _textController.dispose();
    super.dispose();
  }

  void _showCalendarOverlay(BuildContext context) {
    if (_overlayEntry == null) {
      final colorScheme = Theme.of(context).colorScheme;
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      final size = renderBox.size;

      _overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _removeOverlay,
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
                  color: colorScheme.surfaceContainerLow,
                  shadowColor: colorScheme.shadow,
                  child: CalendarDatePicker(
                    initialDate: _selectedDate,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2050),
                    currentDate: DateTime.now(),
                    onDateChanged: (selectedDate) {
                      final now = DateTime.now();
                      final today = DateTime(now.year, now.month, now.day);
                      final isToday = selectedDate.year == today.year &&
                          selectedDate.month == today.month &&
                          selectedDate.day == today.day;

                      if (_selectedDate.month != selectedDate.month ||
                          _selectedDate.day != selectedDate.day ||
                          isToday) {
                        _removeOverlay();
                      }

                      setState(() {
                        _selectedDate = selectedDate;
                        _textController.text = ddMmmYyyy(selectedDate);
                      });

                      widget.onChanged?.call(selectedDate);
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

  void _selectToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    setState(() {
      _selectedDate = today;
      _textController.text = ddMmmYyyy(today);
    });

    widget.onChanged?.call(today);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CompositedTransformTarget(
              link: _layerLink,
              child: AppTextField(
                controller: _textController,
                enabled: widget.enabled,
                label: widget.label,
                hint: widget.hint,
                readOnly: true,
                onTap: () => _showCalendarOverlay(context),
                errorText: widget.errorText,
                isRequired: widget.isRequired,
              ),
            ),
          ),
          if (widget.showTodayButton) AppSpaces.w8,
          if (widget.showTodayButton)
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 48),
              child: ElevatedButton(
                onPressed: _selectToday,
                child: const Text('Today'),
              ),
            ),
        ],
      ),
    );
  }
}
