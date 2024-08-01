import 'package:flutter/material.dart';
import 'package:form_validation/config/constants.dart';
import 'package:form_validation/config/summary_value.dart';
import 'package:form_validation/widgets/text_title_widget.dart';

Future<void> summary(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(child: Text('Summary')),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: content(context),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                disabledForegroundColor:
                    Colors.grey.withOpacity(0.38), // Disabled color
              ).copyWith(
                overlayColor: WidgetStateProperty.all<Color>(
                    Colors.blue.withOpacity(0.2)), // Hover color
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: titleSize, color: Colors.black),
                ),
              ))
        ],
      );
    },
  );
}

Widget content(BuildContext context) {
  Widget showContent(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: normalSize),
    );
  }

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Row(
          children: [
            textTitleWidget('Title: '),
            showContent(title),
          ],
        ),
        const SizedBox(height: 15),

        // Category
        Row(
          children: [
            textTitleWidget('Category: '),
            showContent(category!),
          ],
        ),
        const SizedBox(height: 15),

        // Date
        textTitleWidget('Date: '),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              textTitleWidget(' from: '),
              showContent(startDate!),
              textTitleWidget(' to: '),
              showContent(endDate!),
            ],
          ),
        ),
        const SizedBox(height: 15),

        // Time
        textTitleWidget('Time: '),
        Row(
          children: [
            textTitleWidget(' from: '),
            showContent(startTime!),
            textTitleWidget(' to: '),
            showContent(endTime!),
          ],
        ),
        const SizedBox(height: 15),

        // Frequency
        Row(
          children: [
            textTitleWidget('Frequency: '),
            showContent(frequency!),
          ],
        ),
        const SizedBox(height: 15),

        // Location
        Row(
          children: [
            textTitleWidget('Location: '),
            showContent(location!),
          ],
        ),
        const SizedBox(height: 15),

        // Guests
        textTitleWidget('Guests: '),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: guests
              .map((item) =>
                  Text('+ $item', style: const TextStyle(fontSize: normalSize)))
              .toList(),
        ),
        const SizedBox(height: 15),

        // Guests can
        textTitleWidget('Guest can: '),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: guestCan
              .map((item) =>
                  Text('+ $item', style: const TextStyle(fontSize: normalSize)))
              .toList(),
        ),
        const SizedBox(height: 15),
      ],
    ),
  );
}
