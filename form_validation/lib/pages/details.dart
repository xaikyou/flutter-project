import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/config/constants.dart';
import 'package:form_validation/cubit/category_cubit.dart';
import 'package:form_validation/widgets/category_widget.dart';
import 'package:form_validation/widgets/icon_button_widget.dart';
import 'package:form_validation/widgets/text_form_field_widget.dart';
import 'package:form_validation/widgets/text_title_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.nextButton,
  });

  final Function nextButton;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final categoryCubit = BlocProvider.of<CategoryCubit>(context);

    final TextEditingController titleController = TextEditingController();

    void validate() {
      if (!formKey.currentState!.validate()) {
        return;
      }
      if (categoryCubit.state == initalTitleCategory) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please choose a category')),
        );
        return;
      }
      categoryCubit.updateCategory(initalTitleCategory);
      nextButton();
    }

    String? checkNullTextField(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TItle
                textTitleWidget('Title'),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                  controller: titleController,
                  hintText: 'Title...',
                  validatorFunc: checkNullTextField,
                ),
                const SizedBox(height: 15),

                // Category
                textTitleWidget('Category'),
                const SizedBox(height: 15),

                const CategoryWidget(
                  title: 'Select a category',
                  categoryItem: categoryItem,
                ),

                // Next Button
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButtonWidget(
                    onPressedFunc: () => validate(),
                    icon: const Icon(
                      LineAwesomeIcons.arrow_right_solid,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
