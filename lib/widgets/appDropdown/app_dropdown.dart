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
  final String? label;
  final bool? withLabel;
  final String hint;
  final bool enabled;
  final bool showUnselect;
  final String? labelUnselected;
  final double? minHeight;
  final T? initialValue;

  const AppDropdown({
    super.key,
    required this.items,
    this.withLabel = true,
    this.label,
    this.showUnselect = true,
    this.hint = 'Select...',
    this.enabled = true,
    this.selectedItem,
    this.labelUnselected,
    this.onChanged,
    this.minHeight,
    this.initialValue,
  });

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late TextEditingController _controller;
  DropdownItem<T>? _currentItem;

  @override
  void initState() {
    super.initState();
    _currentItem = widget.selectedItem ?? _findInitialItem();
    _controller = TextEditingController(text: _currentItem?.label ?? '');

    if (_currentItem != null && widget.onChanged != null) {
      widget.onChanged!(_currentItem);
    }
  }

  DropdownItem<T>? _findInitialItem() {
    if (widget.initialValue == null) return null;

    for (var item in widget.items) {
      if (item.id == widget.initialValue) {
        return item;
      }
    }
    return null;
  }

  @override
  void didUpdateWidget(AppDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialValue != oldWidget.initialValue &&
        widget.selectedItem == null) {
      final initialItem = _findInitialItem();
      if (initialItem != null) {
        _currentItem = initialItem;
        _controller.text = initialItem.label;
        widget.onChanged?.call(initialItem);
      }
    }

    if (oldWidget.selectedItem?.label != widget.selectedItem?.label) {
      _currentItem = widget.selectedItem;
      _controller.text = widget.selectedItem?.label ?? '';
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
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

  Widget _buildOverlayContent() {
    final colorScheme = Theme.of(context).colorScheme;
    final itemCount =
        widget.showUnselect ? widget.items.length + 1 : widget.items.length;

    return Card(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 300,
          minHeight: widget.minHeight ?? 0,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          physics: itemCount > 6
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          separatorBuilder: (_, __) =>
              Divider(height: 1, color: colorScheme.outline),
          itemBuilder: (context, index) {
            if (widget.showUnselect && index == 0) {
              return ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side: BorderSide.none,
                ),
                dense: true,
                trailing: Icon(Icons.clear,
                    size: 16, color: colorScheme.onSurfaceVariant),
                title: Text(
                  widget.labelUnselected ?? 'Unselected',
                  style: TextStyle(
                    color: colorScheme.onSurface,
                  ),
                ),
                onTap: () {
                  widget.onChanged?.call(null);
                  _controller.text = '';
                  _removeOverlay();
                },
              );
            }

            final itemIndex = widget.showUnselect ? index - 1 : index;
            final item = widget.items[itemIndex];
            return ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide.none,
              ),
              dense: true,
              selected: widget.selectedItem?.id == item.id,
              selectedTileColor: colorScheme.primaryContainer.withOpacity(0.2),
              title: Text(
                item.label,
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: widget.selectedItem?.id == item.id
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
              onTap: () {
                widget.onChanged?.call(item);
                _controller.text = item.label;
                _removeOverlay();
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          withLabel: widget.withLabel,
          readOnly: true,
          enabled: widget.enabled,
          controller: _controller,
          label: widget.label ?? '',
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
