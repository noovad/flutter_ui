import 'package:flutter/material.dart';

class AppNoDataFound extends StatelessWidget {
  final String? message;
  const AppNoDataFound({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: Theme.of(context).colorScheme.outline,
          ),
          SizedBox(height: 16),
          Text(
            message ?? 'No data found',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
