import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';

class AppDropdown extends StatefulWidget {
  final TextEditingController controller;
  final List<String> items;
  final String label;
  final String? selected;
  final String hint;
  final Function(String)? onChanged;
  final bool enable;
  final String? labelUnselected;

  const AppDropdown({
    super.key,
    required this.controller,
    this.labelUnselected,
    this.onChanged,
    required this.items,
    required this.label,
    this.selected,
    this.hint = 'Select...',
    this.enable = true,
  });

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

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
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(
          height: 1,
          color: Colors.grey,
        ),
        itemCount: widget.items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
              dense: true,
              leading: const Icon(Icons.clear, size: 16),
              title: widget.labelUnselected != null ? Text(widget.labelUnselected!) : const Text('Clear'),
              onTap: () {
                widget.controller.clear();
                _removeOverlay();
              },
            );
          }
          return ListTile(
            dense: true,
            leading: const Icon(Icons.label_outline, size: 16),
            title: Text(widget.items[index - 1]),
            onTap: () {
              widget.controller.text = widget.items[index - 1];
              _removeOverlay();
            },
          );
        },
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
        child: AppTextField(
          controller: widget.controller,
          label: widget.label,
          hint: widget.hint,
          readOnly: true,
          onChanged: widget.onChanged ?? (value) {},
        ),
      ),
    );
  }
}
