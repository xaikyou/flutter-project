import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/config/constants.dart';
import 'package:form_validation/cubit/guest_can_cubit.dart';
import 'package:form_validation/widgets/icon_button_widget.dart';
import 'package:form_validation/widgets/text_button_widget.dart';
import 'package:form_validation/widgets/text_form_field_widget.dart';
import 'package:form_validation/widgets/text_title_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Guests extends StatelessWidget {
  const Guests({
    super.key,
    required this.backButton,
  });

  final Function backButton;

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final guestCanCubit = BlocProvider.of<GuestCanCubit>(context);

    bool isEmail(String? input) => EmailValidator.validate(input!);

    String? checkEmailTextField(String? value) {
      if (!isEmail(value)) {
        return 'Please enter correct email';
      }
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }

    void backFunc() {
      backButton();
    }

    void invite() {
      if (!formKey.currentState!.validate()) {
        return;
      }
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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Guests
                  textTitleWidget('Guests'),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldWidget(
                          controller: emailController,
                          hintText: 'Enter an email address',
                          validatorFunc: checkEmailTextField,
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextButtonWidget(
                        textButton: 'Invite',
                        color: Colors.grey,
                        size: Size.zero,
                        onPressed: () => invite(),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Guests can
                  textTitleWidget('Guests can'),
                  const SizedBox(height: 15),
                  BlocBuilder<GuestCanCubit, GuestCanState>(
                    builder: (_, state) {
                      return Column(
                        children: List.generate(
                          guestCanList.length,
                          (index) => CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            overlayColor:
                                WidgetStateProperty.all<Color>(Colors.white),
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              guestCanList[index]["title"],
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            value: state.checkListItems[index]['value'],
                            onChanged: (value) =>
                                guestCanCubit.toggleItem(index),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15),

                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonWidget(
                        onPressedFunc: () => backFunc(),
                        icon: const Icon(
                          LineAwesomeIcons.arrow_left_solid,
                        ),
                      ),
                      TextButtonWidget(
                        textButton: 'Submit',
                        color: Colors.blue,
                        size: Size.zero,
                        onPressed: () => backFunc(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
