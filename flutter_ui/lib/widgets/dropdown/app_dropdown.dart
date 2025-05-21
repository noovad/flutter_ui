import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';

class AppDropdown extends StatefulWidget {
  final List<String> items;
  final String label;
  final String? selected;
  final String hint;
  final Function(String)? onChanged;
  final bool enable;
  final String? labelUnselected;

  const AppDropdown({
    super.key,
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
  late TextEditingController controller;
  String? _currentSelection;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    // Validasi apakah selected ada di items, jika tidak maka null
    _currentSelection =
        widget.selected != null && widget.items.contains(widget.selected)
            ? widget.selected
            : null;

    controller = TextEditingController(text: _currentSelection ?? '');
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    controller.dispose();
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
              title: widget.labelUnselected != null
                  ? Text(widget.labelUnselected!)
                  : const Text('Clear'),
              onTap: () {
                controller.clear();
                _currentSelection = null;
                widget.onChanged?.call('');
                _removeOverlay();
                setState(() {});
              },
            );
          }
          final item = widget.items[index - 1];
          return ListTile(
            dense: true,
            leading: const Icon(Icons.label_outline, size: 16),
            title: Text(item),
            onTap: () {
              controller.text = item;
              _currentSelection = item;
              widget.onChanged?.call(item);
              _removeOverlay();
              setState(() {});
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
        if (hasFocus && widget.enable) {
          if (_overlayEntry == null) {
            _overlayEntry = _createOverlayEntry();
            Overlay.of(context).insert(_overlayEntry!);
          }
        } else {
          _removeOverlay();
        }
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: AppTextField(
          controller: controller,
          label: widget.label,
          hint: widget.hint,
          readOnly: true,
          enabled: widget.enable,
          onChanged: (_) {
            debugPrint('onChanged: $_currentSelection');
          },
        ),
      ),
    );
  }
}
