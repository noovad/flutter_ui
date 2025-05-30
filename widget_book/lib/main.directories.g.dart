// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widget_book/widgets/app_card.dart' as _i8;
import 'package:widget_book/widgets/app_field.dart' as _i7;
import 'package:widget_book/widgets/app_nav.dart' as _i2;
import 'package:widget_book/widgets/app_pop_over.dart' as _i3;
import 'package:widget_book/widgets/app_shimmer.dart' as _i4;
import 'package:widget_book/widgets/app_tabs.dart' as _i6;
import 'package:widget_book/widgets/app_toast.dart' as _i5;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'Widget',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AppDateNav',
        useCase: _i1.WidgetbookUseCase(
          name: 'Date Navigation',
          builder: _i2.dateNavigation,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppPopOver',
        useCase: _i1.WidgetbookUseCase(
          name: 'PopOver',
          builder: _i3.popOverUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppShimmer',
        useCase: _i1.WidgetbookUseCase(
          name: 'Shimmer',
          builder: _i4.shimmerUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppSimpleToast',
        useCase: _i1.WidgetbookUseCase(
          name: 'Toast',
          builder: _i5.toastUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppTabs',
        useCase: _i1.WidgetbookUseCase(
          name: 'Tabs',
          builder: _i6.tabsUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppTextField',
        useCase: _i1.WidgetbookUseCase(
          name: 'Input',
          builder: _i7.textFieldUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'Card',
        useCase: _i1.WidgetbookUseCase(
          name: 'Card',
          builder: _i8.appCards,
        ),
      ),
    ],
  )
];
