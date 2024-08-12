import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_feature/screens/home_screen.dart';
import 'package:pin_code_feature/screens/pin_code_verifycation_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 2960),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.notoSansMonoTextTheme(),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const PinCodeVerifycationScreen(),
          '/homeScreen': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
