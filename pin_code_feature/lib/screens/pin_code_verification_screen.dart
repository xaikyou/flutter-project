import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class PinCodeVerificationScreen extends StatefulWidget {
  const PinCodeVerificationScreen({super.key});

  @override
  State<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen>
    with RouteAware {
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
      Navigator.pop(context);
      textController.clear();
    }
  }

  @override
  void didPush() {
    super.didPush();
    debugPrint('PinCodeScreen pushed');
  }

  @override
  void didPopNext() {
    super.didPopNext();
    debugPrint('PinCodeScreen is now visible');
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 200.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 160.h),
              child: Icon(
                Icons.shield_moon_rounded,
                size: 500.w,
                color: Colors.blue.shade500,
              ),
            ),
            Text(
              "Please enter PIN",
              style: TextStyle(fontSize: 80.sp),
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
                    errorBorderColor: hasError ? Colors.red : Colors.black,
                    fieldHeight: 200.h,
                    fieldWidth: 150.w,
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
              style: TextStyle(
                color: Colors.red,
                fontSize: 80.sp,
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
                    child: Text(
                      "Verify",
                      style: TextStyle(fontSize: 80.sp),
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
