import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/appField/app_field.dart';
import 'package:flutter_ui/widgets/appField/date_field.dart';
import 'package:flutter_ui/widgets/dropdown/app_dropdown.dart';
import 'package:flutter_ui/widgets/appField/time_field.dart';
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
          AppField(
            controller: widget.titleController,
            label: "Title",
            hint: "Enter title",
            enabled: !widget.status,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Title is required';
              }
              return null;
            },
          ),
          AppDropdown(
            controller: widget.categoryController,
            items: widget.listCategory,
            label: "Category",
            hint: "Select category",
            enable: !widget.status,
          ),
          TimeField(
            controller: widget.timeController,
          ),
          DateField(
            controller: widget.dateController,
          ),
          AppField(
            controller: widget.noteController,
            label: "Notes",
            hint: "Enter notes",
            maxLines: 5,
            minLines: 3,
            enabled: !widget.status,
          ),
        ],
      ),
    );
  }
}
