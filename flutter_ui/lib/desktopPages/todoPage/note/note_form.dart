import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/appField/app_field.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';
import 'package:flutter_ui/widgets/dropdown/app_dropdown.dart';

class NoteForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final TextEditingController categoryController;
  final List<String> categories;

  const NoteForm({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.categoryController,
    required this.categories,
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
        AppField(
          controller: widget.titleController,
          label: 'Title',
          hint: 'Enter note title',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Title is required';
            }
            return null;
          },
        ),
        AppDropdown(
          controller: widget.categoryController,
          items: widget.categories,
          label: 'Category',
          
        ),
        AppField(
          controller: widget.contentController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Content is required';
            }
            return null;
          },
          minLines: 5,
          maxLines: 10,
          hint: 'Write your note here...',
          label: 'Content',
        ),
      ],
    );
  }
}
