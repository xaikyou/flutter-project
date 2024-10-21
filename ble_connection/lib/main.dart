import 'package:ble_connection/bloc/ble_connectivity_bloc.dart';
import 'package:ble_connection/home_page.dart';
import 'package:ble_connection/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await configureDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => BleConnectivityBloc()
            ..add(const BleConnectivityWatch())
            ..add(const BleConnectivityCheck())),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
