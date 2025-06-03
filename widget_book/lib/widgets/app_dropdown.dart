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
          label: 'Select Type',
          selectedItem: const DropdownItem(id: 'all', label: 'All'),
          items: const [
            DropdownItem(id: 'all', label: 'All'),
            DropdownItem(id: 'income', label: 'Income'),
            DropdownItem(id: 'expense', label: 'Expense'),
            DropdownItem(id: 'savings', label: 'Saving'),
          ],
          onChanged: (item) {},
        ),
      ),
    ),
  );
}
