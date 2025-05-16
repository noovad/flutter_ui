import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_form.dart';

enum TodoSheetType { create, update }

enum TaskType { daily, productivity }

class TodoSheet extends StatefulWidget {
  final TodoSheetType? type;
  final TabsType? tabsType;
  final TaskType? taskType;
  final TodoCardData? todoData;
  final ValueChanged<TodoCardData>? onSave;
  final List<String> listCategory;

  const TodoSheet.create({
    super.key,
    required this.onSave,
    required this.tabsType,
    required this.taskType,
    required this.listCategory,
  })  : type = TodoSheetType.create,
        todoData = null;

  const TodoSheet.update({
    super.key,
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
  late String? _selectedCategory;
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
    _selectedCategory = widget.todoData?.category;
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: SingleChildScrollView(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: isCreate
                  ? [
                      ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _onSave,
                        child: const Text('Create'),
                      ),
                    ]
                  : [
                      Visibility(
                        visible: (widget.todoData?.isDone == false) && (widget.tabsType != TabsType.history),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Cancel'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                debugPrint('Update button pressed');
                                _onSave();
                              },
                              child: const Text('Update'),
                            ),
                          ],
                        ),
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }
}
