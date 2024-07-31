import 'package:flutter/material.dart';
import 'package:form_validation/config/constants.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.validatorFunc,
  });

  final TextEditingController controller;
  final String hintText;
  final Function(String? value)? validatorFunc;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.done,
      validator: (value) => validatorFunc!(value),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: normalSize),
        hoverColor: Colors.transparent,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
