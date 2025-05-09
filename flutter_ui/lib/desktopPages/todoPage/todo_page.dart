import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/data.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/note_card.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/tabs_todo.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ShadApp.material(
      theme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadZincColorScheme.dark(),
      ),
      home: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: ClipRRect(
            child: ShadResizablePanelGroup(
              children: [
                ShadResizablePanel(
                  id: 0,
                  defaultSize: .5,
                  minSize: .2,
                  maxSize: .8,
                  child: Center(
                    child: Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(16),
                        child: TodoTabs(
                          todoCardData: todoCards,
                        )),
                  ),
                ),
                ShadResizablePanel(
                  id: 1,
                  defaultSize: .5,
                  child: ShadResizablePanelGroup(
                    axis: Axis.vertical,
                    children: [
                      ShadResizablePanel(
                        id: 0,
                        defaultSize: .3,
                        child: NoteCard(
                          title: 'Sample Title',
                          category: 'Sample Category',
                          onEdit: () {
                            // Handle edit action
                          },
                          onDelete: () {
                            // Handle delete action
                          },
                        ),
                      ),
                      ShadResizablePanel(
                        id: 1,
                        defaultSize: .7,
                        child: Align(child: Text('Three')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
