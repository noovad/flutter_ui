import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/appField/app_text_field.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:flutter_ui/widgets/appDropdown/app_dropdown.dart';

class NoteForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final TextEditingController categoryController;
  final Function(String) titleOnChanged;
  final Function(String) contentOnChanged;
  final String? titleErrorText;
  final String? contentErrorText;

  final List<String> categories;

  const NoteForm({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.categoryController,
    required this.categories,
    required this.titleOnChanged,
    required this.contentOnChanged,
    this.titleErrorText,
    this.contentErrorText,
  });

  @override
  State<NoteForm> createState() => NoteFormState();
}

class NoteFormState extends State<NoteForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSizes.dimen16,
      children: [
        AppTextField(
          onChanged: widget.titleOnChanged,
          label: 'Title',
          hint: 'Enter note title',
          errorText: widget.titleErrorText,
        ),
        AppDropdown(
          items: ['work', 'personal', 'other']
              .map((e) => DropdownItem<String>(id: e, label: e))
              .toList(),
          label: "Category",
          hint: "Select category",
          // enable: !widget.,
          onChanged: (value) {
            debugPrint(value.toString());
          },
        ),
        AppTextField(
          onChanged: widget.contentOnChanged,
          minLines: 5,
          maxLines: 10,
          hint: 'Write your note here...',
          label: 'Content',
          errorText: widget.contentErrorText,
        ),
      ],
    );
  }
}
