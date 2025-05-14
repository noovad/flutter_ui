import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_form.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

enum TodoSheetType { create, update }

enum TaskType { daily, productivity }

class TodoSheet extends StatefulWidget {
  final TodoSheetType? type;
  final TabsType? tabsType;
  final TaskType? taskType;
  final ShadSheetSide side;
  final TodoCardData? todoData;
  final ValueChanged<TodoCardData>? onSave;
  final List<String> listCategory;

  const TodoSheet.create({
    super.key,
    required this.side,
    required this.onSave,
    required this.tabsType,
    required this.taskType,
    required this.listCategory,
  })  : type = TodoSheetType.create,
        todoData = null;

  const TodoSheet.update({
    super.key,
    required this.side,
    required this.todoData,
    required this.taskType,
    required this.listCategory,
    required this.tabsType,
    required this.onSave,
  }) : type = null;

  @override
  State<TodoSheet> createState() => _TodoSheetState();
}

class _TodoSheetState extends State<TodoSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _noteController;
  late final TextEditingController _dateController;
  late final TextEditingController _timeController;
  late String _selectedCategory;
  late bool _status;

  bool get isCreate => widget.type == TodoSheetType.create;

  @override
  void initState() {
    super.initState();
    _titleController = widget.todoData?.title != null ? TextEditingController(text: widget.todoData!.title) : TextEditingController();
    _noteController = widget.todoData?.note != null ? TextEditingController(text: widget.todoData!.note) : TextEditingController();
    _dateController =
        widget.todoData?.date != null ? TextEditingController(text: widget.todoData!.date.toString()) : TextEditingController();
    _timeController = widget.todoData?.time != null ? TextEditingController(text: widget.todoData!.time) : TextEditingController();
    _selectedCategory = widget.todoData?.category ?? 'None';
    _status = widget.todoData?.isDone ?? false;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _noteController.dispose();
    _dateController.dispose();
    _timeController.dispose();
  }

  void _onSave() {
    final todo = TodoCardData(
      id: widget.todoData?.id,
      title: _titleController.text,
      isDone: false,
      date: DateTime.parse(_dateController.text),
      category: _selectedCategory,
      time: _timeController.text,
      note: _noteController.text,
    );

    widget.onSave?.call(todo);
  }

  @override
  Widget build(BuildContext context) {
    return ShadSheet(
      constraints: BoxConstraints(
        minWidth: 520,
        maxWidth: MediaQuery.of(context).size.width / 2,
      ),
      title: widget.taskType == TaskType.daily
          ? Text(isCreate ? 'Create Todo Daily' : 'Detail Todo Daily')
          : Text(isCreate ? 'Create Todo Productivity' : 'Detail Todo Productivity'),
      actions: isCreate
          ? [
              ShadButton(
                size: ShadButtonSize.sm,
                child: const Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              ShadButton(
                size: ShadButtonSize.sm,
                onPressed: _onSave,
                child: const Text('Create'),
              ),
            ]
          : [
              Visibility(
                visible: !(widget.todoData?.isDone ?? false),
                child: ShadButton(
                  size: ShadButtonSize.sm,
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Visibility(
                visible: !(widget.todoData?.isDone ?? false),
                child: ShadButton(
                  size: ShadButtonSize.sm,
                  onPressed: () {
                    debugPrint('Update button pressed');
                    _onSave();
                  },
                  child: const Text('Update'),
                ),
              ),
            ],
      child: TodoForm(
        tabsType: widget.tabsType,
        listCategory: widget.listCategory,
        taskType: widget.taskType,
        status: _status,
        selectedCategory: _selectedCategory,
        onCategoryChanged: (c) => setState(() => _selectedCategory = c),
        titleController: _titleController,
        noteController: _noteController,
        dateController: _dateController,
        timeController: _timeController,
      ),
    );
  }
}
