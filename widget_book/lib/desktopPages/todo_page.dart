import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

final todo = WidgetbookUseCase(
  name: 'Todo Page',
  builder: (context) => Center(
    child: MyWidget(),
  ),
);

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('yuhuu'),
    );
  }
}
