import 'package:flutter/material.dart';
import 'package:flutter_ui/shared/themes/app_theme_data.dart';
import 'package:flutter_ui/widgets/appShimmer/app_shimmer.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

enum ShimmerVariant { rectangle, circle }

@UseCase(name: 'Shimmer', type: AppShimmer, path: 'Widget')
Widget shimmerUseCase(BuildContext context) {
  final variant = context.knobs.list<ShimmerVariant>(
    label: 'Variant',
    options: ShimmerVariant.values,
    initialOption: ShimmerVariant.rectangle,
  );

  final width = context.knobs.double.slider(
    label: 'Width',
    initialValue: 300,
    min: 50,
    max: 500,
  );

  final height = variant == ShimmerVariant.rectangle
      ? context.knobs.double.slider(
          label: 'Height',
          initialValue: 300,
          min: 50,
          max: 500,
        )
      : width;

  final borderRadius = variant == ShimmerVariant.rectangle
      ? context.knobs.double.slider(
          label: 'Border Radius',
          initialValue: 0,
          min: 0,
          max: 50,
        )
      : null;

  return MaterialApp(
    theme: AppTheme.lightTheme(),
    home: Center(
      child: AppShimmer(
        height: height,
        width: width,
        shape: variant == ShimmerVariant.rectangle
            ? ShimmerShape.rectangle
            : ShimmerShape.circle,
        borderRadius: borderRadius,
      ),
    ),
  );
}
