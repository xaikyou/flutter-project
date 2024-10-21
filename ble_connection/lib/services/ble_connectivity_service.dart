import 'dart:async';
import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher_string.dart';

@lazySingleton
class BleConnectivityService {
  BleConnectivityService() {
    _subscription = FlutterBluePlus.adapterState
        .listen((BluetoothAdapterState state) async {
      _bleController.add(await isBleConnected);
    });
  }

  late StreamSubscription<BluetoothAdapterState> _subscription;

  final StreamController<bool> _bleController = StreamController();
  Stream<bool> get onBleChanged => _bleController.stream;

  Future<bool> get isBleConnected async {
    final state = await FlutterBluePlus.adapterState.first;
    return state == BluetoothAdapterState.on;
  }

  Future<void> openBle() async {
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    } else if (Platform.isIOS) {
      const url = 'App-Prefs:root=Bluetooth';
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      }
    }
  }

  List<BluetoothDevice> get connectedDevices =>
      FlutterBluePlus.connectedDevices;

  Future<void> dispose() async {
    await _subscription.cancel();
  }
}
