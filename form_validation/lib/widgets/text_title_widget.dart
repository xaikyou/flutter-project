import 'package:flutter/material.dart';
import 'package:form_validation/config/constants.dart';

Widget textTitleWidget(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: normalSize,
      fontWeight: FontWeight.bold,
    ),
  );
}
