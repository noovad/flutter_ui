import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appDropdown/app_dropdown.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Dropdown', type: AppDropdown, path: 'Widget')
Widget dropdown(BuildContext context) {
  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: SizedBox(
        width: 300,
        child: AppDropdown(
          showUnselect: false,
          withLabel: false,
          items: const [
            DropdownItem<String>(id: 'Item 1', label: 'Item 1'),
            DropdownItem<String>(id: 'Item 2', label: 'Item 2'),
            DropdownItem<String>(id: 'Item 3', label: 'Item 3'),
          ],
          // label: 'Select an item',
        ),
      ),
    ),
  );
}
