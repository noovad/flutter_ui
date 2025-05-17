import 'package:flutter/material.dart';

class AppDropdown extends StatefulWidget {
  final List<String> items;
  final String label;
  final String? selected;
  final bool isRequired;
  final String hint;
  final bool enable;
  final void Function(String?)? onChanged;

  const AppDropdown({
    super.key,
    required this.items,
    required this.label,
    this.selected,
    this.isRequired = false,
    this.hint = 'Select...',
    this.enable = true,
    this.onChanged,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  late String? _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _currentValue,
      onChanged: widget.enable
          ? (value) {
              setState(() => _currentValue = value);
              if (widget.onChanged != null) widget.onChanged!(value);
            }
          : null,
      items: widget.items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      decoration: InputDecoration(
        labelText: widget.label + (widget.isRequired ? ' *' : ''),
        hintText: widget.hint,
        enabled: widget.enable,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      style: TextStyle(
        color: widget.enable ? Colors.black : Colors.grey,
        fontSize: 14,
      ),
    );
  }
}
