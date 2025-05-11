import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/type.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo/todo_sheet.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TablePage extends StatelessWidget {
  final List<TodoCardData> data;
  const TablePage({
    super.key,
    required this.data,
  });

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
                child: const Icon(LucideIcons.chevronLeft),
                onPressed: () {},
              ),
              const SizedBox(width: 12),
              Text(
                'Maret / 2024',
                style: ShadTheme.of(context).textTheme.p,
              ),
              const SizedBox(width: 12),
              ShadButton.secondary(
                size: ShadButtonSize.sm,
                child: const Icon(LucideIcons.chevronRight),
                onPressed: () {},
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
                if (index == 4) {
                  return const MaxTableSpanExtent(
                    FixedTableSpanExtent(150),
                    RemainingTableSpanExtent(),
                  );
                }
                return null;
              },
              onRowTap: (row) {
                final todo = data[row - 1];
                debugPrint('Tapped todo: ${todo.title}');
                showShadSheet(
                  side: ShadSheetSide.right,
                  context: context,
                  builder: (context) => TodoSheet(
                    side: ShadSheetSide.right,
                    todoData: todo,
                    listCategory: [],
                    taskType: null,
                  ),
                );
              },
              children: data.map(
                (todo) => [
                  ShadTableCell(
                    child: Text(
                      todo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ShadTableCell(
                    child: Text(DateFormat('dd MMM yyyy').format(todo.date)),
                  ),
                  ShadTableCell(
                    child: Text(todo.category ?? ''),
                  ),
                  ShadTableCell(
                    child: Text(todo.time != null
                        ? DateFormat('HH:mm').format(todo.time!)
                        : ''),
                  ),
                  ShadTableCell(
                    alignment: Alignment.centerLeft,
                    child: Text(todo.note ?? ''),
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
