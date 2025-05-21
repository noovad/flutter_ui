import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/appSheet/app_sheet.dart';
import 'package:flutter_ui/widgets/appNav/month_nav.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo/todo_section.dart';
import 'package:flutter_ui/desktopPages/todoPage/todo/todo_sheet.dart';
import 'package:intl/intl.dart';

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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 104,
      child: Column(
        spacing: 16,
        children: [
          MonthNav(
            displayedDate: ValueNotifier<DateTime>(DateTime.now()),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                  ),
                  child: DataTable(
                    dividerThickness: 0.2,
                    showCheckboxColumn: false,
                    columns: const [
                      DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Title', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Category', style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(label: Text('Time', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: widget.data
                        .map(
                          (todo) => DataRow(
                            onSelectChanged: (selected) {
                              appSheet(
                                context: context,
                                side: SheetSide.right,
                                builder: (context) => TodoSheet.detail(
                                  todoData: todo,
                                  tabsType: TabsType.history,
                                ),
                              );
                            },
                            cells: [
                              DataCell(
                                Text(
                                  DateFormat('dd MMM yyyy').format(todo.date!),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  todo.title!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  todo.category ?? '',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  (todo.time ?? ''),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
