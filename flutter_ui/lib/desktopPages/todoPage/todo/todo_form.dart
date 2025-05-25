import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';
import 'package:flutter_ui/widgets/appDropdown/app_dropdown.dart';
import 'package:flutter_ui/widgets/appField/app_time_field.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo/todo_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';

class TodoForm extends StatefulWidget {
  final TabsType tabsType;
  final TaskType? taskType;
  final TextEditingController titleController;
  final TextEditingController noteController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController categoryController;
  final bool status;
  final List<String> listCategory;
  final FormFieldValidator<String>? titleValidator;
  final FormFieldValidator<String>? dateValidator;
  final FormFieldValidator<String>? noteValidator;

  const TodoForm({
    super.key,
    required this.tabsType,
    required this.taskType,
    required this.titleController,
    required this.noteController,
    required this.dateController,
    required this.timeController,
    required this.status,
    required this.listCategory,
    required this.categoryController,
    this.titleValidator,
    this.dateValidator,
    this.noteValidator,
  });

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSizes.dimen24,
        children: [
          AppTextField(
            label: "Title",
            hint: "Enter title",
            enabled: !widget.status,
            onChanged: (yow) {},
          ),
          AppDropdown(
            items: [],
            label: "Category",
            hint: "Select category",
            enable: !widget.status,
            selectedItem: widget.categoryController.text.isNotEmpty
                ? DropdownItem<String>(
                    id: widget.categoryController.text,
                    label: widget.categoryController.text,
                  )
                : null,
            onChanged: (value) {},
          ),
          // AppTimeField(
          //   controller: widget.timeController,
          // ),
          // AppDateField(
          //   controller: widget.dateController,
          // ),
          AppTextField(
            label: "Notes",
            hint: "Enter notes",
            maxLines: 5,
            minLines: 3,
            enabled: !widget.status,
            onChanged: (yow) {},
          ),
        ],
      ),
    );
  }
}
