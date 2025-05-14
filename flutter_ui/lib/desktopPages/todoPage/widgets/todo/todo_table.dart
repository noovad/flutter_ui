import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TablePage extends StatefulWidget {
  final List<TodoCardData> data;
  const TablePage({
    super.key,
    required this.data,
  });

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(
        _currentDate.year,
        _currentDate.month + 1,
        1,
      );
    });
  }

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(
        _currentDate.year,
        _currentDate.month - 1,
        1,
      );
    });
  }

  String _formatCurrentMonth() {
    return DateFormat('MMMM / yyyy').format(_currentDate);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 104,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadButton.secondary(
                size: ShadButtonSize.sm,
                onPressed: _previousMonth,
                child: const Icon(LucideIcons.chevronLeft),
              ),
              const SizedBox(width: 12),
              Text(
                _formatCurrentMonth(),
                style: ShadTheme.of(context).textTheme.p,
              ),
              const SizedBox(width: 12),
              ShadButton.secondary(
                size: ShadButtonSize.sm,
                onPressed: _nextMonth,
                child: const Icon(LucideIcons.chevronRight),
              ),
            ],
          ),
          Expanded(
            child: ShadTable.list(
              header: const [
                ShadTableCell.header(child: Text('Title')),
                ShadTableCell.header(child: Text('Date')),
                ShadTableCell.header(child: Text('Category')),
                ShadTableCell.header(child: Text('Time')),
                ShadTableCell.header(child: Text('Note')),
              ],
              columnSpanExtent: (index) {
                if (index == 0) {
                  return const FixedTableSpanExtent(200);
                }
                if (index == 1) {
                  return const FixedTableSpanExtent(120);
                }
                if (index == 4) {
                  return const MaxTableSpanExtent(
                    FixedTableSpanExtent(150),
                    RemainingTableSpanExtent(),
                  );
                }
                return null;
              },
              onRowTap: (row) {
                final todo = widget.data[row - 1];
                showShadSheet(
                  side: ShadSheetSide.right,
                  context: context,
                  builder: (context) => TodoSheet.update(
                    tabsType: null,
                    side: ShadSheetSide.right,
                    todoData: todo,
                    listCategory: [],
                    taskType: null,
                    onSave: null,
                  ),
                );
              },
              children: widget.data.map(
                (todo) => [
                  ShadTableCell(
                    child: Text(
                      todo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ShadTableCell(
                    child: Text(
                      DateFormat('dd MMM yyyy').format(todo.date),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ShadTableCell(
                    child: Text(
                      todo.category ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ShadTableCell(
                    child: Text(
                      (todo.time is DateTime && todo.time != null)
                          ? DateFormat('HH:mm').format(todo.time as DateTime)
                          : (todo.time?.toString() ?? ''),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ShadTableCell(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      todo.note ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
