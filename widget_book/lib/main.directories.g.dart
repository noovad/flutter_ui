// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widget_book/widgets/app_button.dart' as _i3;
import 'package:widget_book/widgets/app_card.dart' as _i13;
import 'package:widget_book/widgets/app_dialog.dart' as _i5;
import 'package:widget_book/widgets/app_dropdown.dart' as _i6;
import 'package:widget_book/widgets/app_field.dart' as _i12;
import 'package:widget_book/widgets/app_nav.dart' as _i4;
import 'package:widget_book/widgets/app_pop_over.dart' as _i8;
import 'package:widget_book/widgets/app_sheet.dart' as _i14;
import 'package:widget_book/widgets/app_shimmer.dart' as _i9;
import 'package:widget_book/widgets/app_tabs.dart' as _i11;
import 'package:widget_book/widgets/app_toast.dart' as _i10;
import 'package:widget_book/widgets/color.dart' as _i2;
import 'package:widget_book/widgets/utils.dart' as _i7;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'Color Scheme',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'ThemeData',
        useCase: _i1.WidgetbookUseCase(
          name: 'Color',
          builder: _i2.colorScheme,
        ),
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'Widget',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'AppButton',
        useCase: _i1.WidgetbookUseCase(
          name: 'Icon',
          builder: _i3.appButton,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'AppDateNav',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Date Navigation',
            builder: _i4.dateNavigation,
          ),
          _i1.WidgetbookUseCase(
            name: 'Year Navigation',
            builder: _i4.yearNavigation,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppDialog',
        useCase: _i1.WidgetbookUseCase(
          name: 'Dialog',
          builder: _i5.appDialogGeneral,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppDropdown',
        useCase: _i1.WidgetbookUseCase(
          name: 'Dropdown',
          builder: _i6.dropdown,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppNoDataFound',
        useCase: _i1.WidgetbookUseCase(
          name: 'No Data Found',
          builder: _i7.appUtils,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppPopOver',
        useCase: _i1.WidgetbookUseCase(
          name: 'PopOver',
          builder: _i8.popOverUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppShimmer',
        useCase: _i1.WidgetbookUseCase(
          name: 'Shimmer',
          builder: _i9.shimmerUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppSimpleToast',
        useCase: _i1.WidgetbookUseCase(
          name: 'Toast',
          builder: _i10.toastUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppTabs',
        useCase: _i1.WidgetbookUseCase(
          name: 'Tabs',
          builder: _i11.tabsUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'AppTextField',
        useCase: _i1.WidgetbookUseCase(
          name: 'Input',
          builder: _i12.textFieldUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'Card',
        useCase: _i1.WidgetbookUseCase(
          name: 'Card',
          builder: _i13.appCards,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'SheetSide',
        useCase: _i1.WidgetbookUseCase(
          name: 'Sheet',
          builder: _i14.appButton,
        ),
      ),
    ],
  ),
];
