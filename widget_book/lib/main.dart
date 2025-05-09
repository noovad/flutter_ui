import 'package:flutter/material.dart';
import 'package:widget_book/pages.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      initialRoute: '?path=desktop-pages/todo-page',
      directories: [
        WidgetbookComponent(
          name: 'Desktop Pages',
          useCases: desktopPages,
        ),
        WidgetbookCategory(
          name: 'Widgets',
          children: widgets,
        ),
      ],
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light().copyWith(
                scaffoldBackgroundColor: Colors.white,
              ),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.linux.laptop,
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13,
          ],
        ),
      ],
    );
  }
}
