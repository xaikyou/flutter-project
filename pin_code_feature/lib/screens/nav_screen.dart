import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_feature/main.dart';
import 'package:pin_code_feature/widgets/bottom_nav_bar_widget.dart';
import 'package:pin_code_feature/widgets/camera_widget.dart';
import 'dart:async';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with WidgetsBindingObserver {
  int _selectedIndex = 0;

  Timer? _timer;
  final Duration _delay = const Duration(seconds: 0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        _detached();
        break;
      case AppLifecycleState.resumed:
        _resumed();
        break;
      case AppLifecycleState.inactive:
        _inactive();
        break;
      case AppLifecycleState.hidden:
        _hidden();
        break;
      case AppLifecycleState.paused:
        _paused();
        break;
    }
  }

  void _startPauseTimer() {
    _timer?.cancel();
    _timer = Timer(_delay, _navigateToPinCodeScreen);
  }

  void _navigateToPinCodeScreen() {
    if (!mounted) return;

    if (!customNavigatorObserver.isRouteActive('/pinScreen')) {
      Navigator.pushNamed(context, '/pinScreen');
    }
  }

  // Handle state changes
  void _detached() {
    debugPrint('Detached');
    _timer?.cancel();
  }

  void _resumed() {
    debugPrint('Resumed');
    _timer?.cancel();
  }

  void _inactive() {
    debugPrint('Inactive');
    _timer?.cancel();
  }

  void _hidden() {
    debugPrint('Hidden');
    _timer?.cancel();
  }

  void _paused() {
    debugPrint('Paused');
    _startPauseTimer();
  }

  // bottom nav bar method
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CameraWidget()),
              ),
              icon: const Icon(
                Icons.qr_code_scanner_outlined,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      // body: screens[_selectedIndex],
    );
  }
}
