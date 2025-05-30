import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';

class DropdownItem<T> {
  final T id;
  final String label;

  const DropdownItem({required this.id, required this.label});
}

class AppDropdown<T> extends StatefulWidget {
  final List<DropdownItem<T>> items;
  final DropdownItem<T>? selectedItem;
  final void Function(DropdownItem<T>?)? onChanged;
  final String label;
  final String hint;
  final bool enabled;
  final String? labelUnselected;

  const AppDropdown({
    super.key,
    required this.items,
    required this.label,
    this.hint = 'Select...',
    this.enabled = true,
    this.selectedItem,
    this.labelUnselected,
    this.onChanged,
  });

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
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
              child: _buildOverlayContent(),
            ),
          ),
        ],
      ),
    );
  }

  Material _buildOverlayContent() {
    return Material(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.items.length + 1,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, color: Colors.grey),
        itemBuilder: (context, index) {
          if (index == 0) {
            return ListTile(
              dense: true,
              trailing: const Icon(Icons.clear, size: 16),
              title: Text(
                widget.labelUnselected ?? 'Unselected',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () {
                widget.onChanged?.call(null);
                _removeOverlay();
              },
            );
          }

          final item = widget.items[index - 1];
          return ListTile(
            dense: true,
            title: Text(
              item.label,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              widget.onChanged?.call(item);
              _removeOverlay();
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedText = widget.selectedItem?.label ?? '';

    return Focus(
      onFocusChange: (hasFocus) {
        if (hasFocus && widget.enabled) {
          if (_overlayEntry == null) {
            _overlayEntry = _createOverlayEntry();
            Overlay.of(context).insert(_overlayEntry!);
          }
        }
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: AppTextField(
          readOnly: true,
          enabled: widget.enabled,
          controller: TextEditingController(text: selectedText),
          label: widget.label,
          hint: widget.hint,
          onTap: () {
            if (_overlayEntry == null && widget.enabled) {
              _overlayEntry = _createOverlayEntry();
              Overlay.of(context).insert(_overlayEntry!);
            }
          },
        ),
      ),
    );
  }
}
