import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/sizes/app_padding.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    const int startDay = 1;

    return Padding(
      padding: AppPadding.all16,
      child: Column(
        spacing: 12,
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
                'Maret | 2024',
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
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return Visibility(
                  visible: index >= startDay,
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.grey,
                    color: ((index + 1) % 7) == 0 ? Color(0xFF222222) : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${index - startDay + 1}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Text('5'),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              spacing: AppSizes.dimen4,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(width: 4),
                                    const Icon(LucideIcons.code,
                                        color: Colors.red),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      LucideIcons.bicepsFlexed,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      LucideIcons.heartPlus,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                Text('23'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 29 + startDay,
            ),
          ),
        ],
      ),
    );
  }
}
