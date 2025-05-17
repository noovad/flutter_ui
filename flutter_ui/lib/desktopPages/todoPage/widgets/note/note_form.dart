import 'package:flutter/material.dart';
import 'package:flutter_ui/desktopPages/todoPage/widgets/component/app_text_field.dart';
import 'package:flutter_ui/shared/sizes/app_sizes.dart';

class NoteForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController contentController;
  final String selectedCategory;
  final List<String> categories;
  final ValueChanged<String> onCategoryChanged;

  const NoteForm({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.selectedCategory,
    required this.categories,
    required this.onCategoryChanged,
  });

  @override
  State<NoteForm> createState() => NoteFormState();
}

class NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String currentCategory;

  @override
  void initState() {
    super.initState();
    currentCategory = widget.selectedCategory;
  }

  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: AppSizes.dimen16,
        children: [
          AppTextField(
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
          // AppDropdown(
          //   items: widget.categories,
          //   selectedItem: null,
          //   onChanged: (value) {
          //     setState(() {
          //       currentCategory = value ?? '';
          //     });
          //     widget.onCategoryChanged(value ?? '');
          //   },
          //   label: 'Category',
          // ),
          AppTextField(
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
      ),
    );
  }
}
