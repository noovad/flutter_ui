import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/component/app_dropdown.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/component/app_text_field.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:intl/intl.dart';

class TodoForm extends StatefulWidget {
  final TabsType tabsType;
  final List<String> listCategory;
  final TaskType taskType;
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;
  final bool status;
  final TextEditingController titleController;
  final TextEditingController noteController;
  final TextEditingController dateController;
  final TextEditingController timeController;

  const TodoForm({
    super.key,
    required this.taskType,
    required this.tabsType,
    required this.status,
    required this.onCategoryChanged,
    required this.titleController,
    required this.noteController,
    required this.dateController,
    required this.timeController,
    required this.selectedCategory,
    required this.listCategory,
  });

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String? currentCategory;

  @override
  void initState() {
    super.initState();
    currentCategory = widget.selectedCategory;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.dateController.text.isNotEmpty ? DateTime.tryParse(widget.dateController.text) ?? DateTime.now() : DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        widget.dateController.text = picked.toString();
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final initialTime = widget.timeController.text.isNotEmpty
        ? TimeOfDay.fromDateTime(DateFormat('HH:mm').parse(widget.timeController.text))
        : TimeOfDay.now();

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (context, child) => Theme(
        data: Theme.of(context),
        child: child!,
      ),
    );

    if (picked != null) {
      setState(() {
        widget.timeController.text = picked.format(context);
      });
    }
  }

  @override
  void dispose() {
    widget.titleController.dispose();
    widget.noteController.dispose();
    widget.dateController.dispose();
    widget.timeController.dispose();
    super.dispose();
  }

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
          Visibility(
            visible: widget.tabsType != TabsType.auto,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppDropdown(
                  items: widget.listCategory,
                  selectedItem: widget.selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      currentCategory = value ?? '';
                    });
                    widget.onCategoryChanged(value ?? '');
                  },
                  label: 'Category',
                ),
                const SizedBox(height: AppSizes.dimen16),
              ],
            ),
          ),
          InkWell(
            onTap: !widget.status ? () => _selectDate(context) : null,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                enabled: !widget.status,
                suffixIcon: Icon(Icons.calendar_today),
              ),
              child: Text(
                widget.dateController.text.isNotEmpty
                    ? DateFormat('yyyy-MM-dd').format(
                        DateTime.parse(widget.dateController.text),
                      )
                    : 'Select date',
              ),
            ),
          ),
          InkWell(
            onTap: !widget.status ? () => _selectTime(context) : null,
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Time',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                enabled: !widget.status,
                suffixIcon: Icon(Icons.access_time),
              ),
              child: Text(
                widget.timeController.text.isNotEmpty ? widget.timeController.text : 'Select time',
              ),
            ),
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
