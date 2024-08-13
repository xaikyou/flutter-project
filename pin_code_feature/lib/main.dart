import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_feature/custom_navigator_observer.dart';
import 'package:pin_code_feature/injection_container.dart';
import 'package:pin_code_feature/screens/nav_screen.dart';
import 'package:pin_code_feature/screens/pin_code_verification_screen.dart';

final CustomNavigatorObserver customNavigatorObserver =
    CustomNavigatorObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
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
        navigatorObservers: [customNavigatorObserver],
        initialRoute: '/pinScreen',
        routes: {
          '/': (context) => const NavScreen(),
          '/pinScreen': (context) => const PinCodeVerificationScreen(),
        },
      ),
    );
  }
}
