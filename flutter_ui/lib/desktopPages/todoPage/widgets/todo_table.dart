import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/data.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/todo_sheet.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TablePage extends StatelessWidget {
  const TablePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height - 104,
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
          final todo = todoCardP[row - 1];
          debugPrint('Tapped todo: ${todo.title}');
          showShadSheet(
            side: ShadSheetSide.right,
            context: context,
            builder: (context) => TodoSheet.detail(
              side: ShadSheetSide.right,
              todoData: todo,
              listCategory: [],
              taskType: null,
            ),
          );
        },
        children: todoCardP.map(
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
              child: Text(todo.category ?? 'N/A'),
            ),
            ShadTableCell(
              child: Text(todo.time != null
                  ? DateFormat('HH:mm').format(todo.time!)
                  : ''),
            ),
            ShadTableCell(
              alignment: Alignment.centerRight,
              child: Text(todo.note ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
