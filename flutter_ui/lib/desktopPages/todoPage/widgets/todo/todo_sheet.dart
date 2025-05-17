import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_form.dart';

enum TodoSheetType { create, update, detail }

enum TaskType { daily, productivity }

class TodoSheet extends StatefulWidget {
  final TodoSheetType? type;
  final TabsType? tabsType;
  final TaskType? taskType;
  final TodoCardData? todoData;
  final ValueChanged<TodoCardData>? onSave;
  final List<String>? listCategory;

  const TodoSheet.create({
    super.key,
    required this.tabsType,
    required this.taskType,
    required this.onSave,
    required this.listCategory,
  })  : type = TodoSheetType.create,
        todoData = null;

  const TodoSheet.update({
    super.key,
    required this.todoData,
    required this.tabsType,
    required this.onSave,
    required this.taskType,
    required this.listCategory,
  }) : type = TodoSheetType.update;

  const TodoSheet.detail({
    super.key,
    required this.todoData,
    required this.tabsType,
  })  : type = TodoSheetType.detail,
        taskType = null,
        listCategory = null,
        onSave = null;

  @override
  State<TodoSheet> createState() => _TodoSheetState();
}

class _TodoSheetState extends State<TodoSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _noteController;
  late final TextEditingController _dateController;
  late final TextEditingController _timeController;
  late String? _selectedCategory;
  late bool _status;

  bool get isCreate => widget.type == TodoSheetType.create;
  bool get isUpdate => widget.type == TodoSheetType.update;
  bool get isDetail => widget.type == TodoSheetType.detail;

  @override
  void initState() {
    super.initState();
    _titleController = widget.todoData?.title != null ? TextEditingController(text: widget.todoData!.title) : TextEditingController();
    _noteController = widget.todoData?.note != null ? TextEditingController(text: widget.todoData!.note) : TextEditingController();
    _dateController =
        widget.todoData?.date != null ? TextEditingController(text: widget.todoData!.date.toString()) : TextEditingController();
    _timeController = widget.todoData?.time != null ? TextEditingController(text: widget.todoData!.time) : TextEditingController();
    _status = widget.todoData?.isDone ?? false;
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
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: TodoForm(
                tabsType: widget.tabsType!,
                taskType: widget.taskType,
                titleController: _titleController,
                noteController: _noteController,
                dateController: _dateController,
                timeController: _timeController,
                status: _status,
                listCategory: widget.listCategory ?? [],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              children: [
                Visibility(
                  visible: isCreate,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _onSave,
                        child: const Text('Create'),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isUpdate && !_status,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('Update button pressed');
                          final snackBar = SnackBar(
                            content: Text(
                                'Updating: ${_titleController.text}, Note: ${_noteController.text}, Date: ${_dateController.text}, Time: ${_timeController.text}'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          _onSave();
                        },
                        child: const Text('Update'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
