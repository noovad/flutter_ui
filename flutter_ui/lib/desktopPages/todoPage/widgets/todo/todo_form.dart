import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/component/app_text_field.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/component/date_field.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/component/time_field.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';

class TodoForm extends StatefulWidget {
  final TabsType tabsType;
  final TaskType? taskType;
  final TextEditingController titleController;
  final TextEditingController noteController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final bool status;
  final List<String> listCategory;
  final String? selectedCategory;

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
    this.selectedCategory,
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
          TimeField(
            controller: widget.timeController,
          ),
          DateField(
            controller: widget.dateController,
          ),
          AppTextField(
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
