import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerifycationScreen extends StatefulWidget {
  const PinCodeVerifycationScreen({super.key});

  @override
  State<PinCodeVerifycationScreen> createState() =>
      _PinCodeVerifycationScreenState();
}

class _PinCodeVerifycationScreenState extends State<PinCodeVerifycationScreen> {
  String pinCode = "1509";
  bool hasError = false;
  bool hasFilledAllFiled = true;

  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  /// Method
  void onValidate() {
    formKey.currentState?.validate();

    if (textController.text.length < 4) {
      errorController.add(ErrorAnimationType.shake);
      setState(() {
        hasFilledAllFiled = false;
      });
    } else {
      setState(() {
        hasFilledAllFiled = true;
      });
    }

    if (hasFilledAllFiled == true && textController.text != pinCode) {
      errorController.add(ErrorAnimationType.shake);
      setState(() {
        hasError = true;
      });
      textController.clear();
    } else if (hasFilledAllFiled == true && textController.text == pinCode) {
      setState(() {
        hasError = false;
      });
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //   content: Text('Congratulation'),
      //   duration: Duration(milliseconds: 1000),
      // ));
      Navigator.pushNamed(context, '/homeScreen');
      textController.clear();
    }
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 200.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 160.h),
              child: Icon(
                Icons.shield_moon_rounded,
                size: 200,
                color: Colors.blue.shade500,
              ),
            ),
            const Text(
              "Please enter PIN",
              style: TextStyle(fontSize: 30),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50.h),
                child: PinCodeTextField(
                  appContext: context,
                  controller: textController,
                  errorAnimationController: errorController,
                  length: 4,
                  obscureText: false,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.number,
                  animationDuration: const Duration(milliseconds: 150),
                  textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.r),
                    inactiveColor: Colors.black,
                    fieldHeight: 200.h,
                    fieldWidth: 160.w,
                  ),
                  onTap: () {
                    setState(() {
                      hasError = false;
                      hasFilledAllFiled = true;
                    });
                  },
                ),
              ),
            ),
            Text(
              hasFilledAllFiled == false
                  ? "*Please fill up all the cells"
                  : hasError == true
                      ? "Incorect PIN code"
                      : "",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 80.h),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: onValidate,
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    backgroundColor: Colors.blue.shade500,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
