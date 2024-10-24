import 'dart:async';

import 'package:ble_connection/constants/duration.dart';
import 'package:ble_connection/utils/snackbar.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';

@injectable
class BleScanDeviceService {
  BleScanDeviceService() {
    _initializeStreams();
  }

  /// Scan Result
  final StreamController<List<ScanResult>> _scanResultsController =
      StreamController.broadcast();
  StreamSubscription<List<ScanResult>>? _scanResultsSubscription;
  Stream<List<ScanResult>> get scanResults => _scanResultsController.stream;

  /// Chech if is scanning
  final StreamController<bool> _isScanningController =
      StreamController.broadcast();
  StreamSubscription<bool>? _isScanningSubscription;
  Stream<bool> get isScanning => _isScanningController.stream;

  void _initializeStreams() {
    _scanResultsSubscription = FlutterBluePlus.scanResults.listen((device) {
      _scanResultsController.add(device);
    });

    _isScanningSubscription = FlutterBluePlus.isScanning.listen((status) {
      _isScanningController.add(status);
    });
  }

  Future<void> startScan() async {
    try {
      await FlutterBluePlus.startScan(
        timeout: scanTimeOut,
        // set device to go away when no longer available
        // removeIfGone: const Duration(seconds: 5),
      );
    } catch (e) {
      Snackbar.show(
        prettyException("Start Scan Error:", e),
        success: false,
      );
    }
  }

  Future<void> stopScan() async {
    try {
      await FlutterBluePlus.stopScan();
    } catch (e) {
      Snackbar.show(
        prettyException("Stop Scan Error:", e),
        success: false,
      );
    }
  }

  Future<List<BluetoothDevice>> get connectedDevices =>
      FlutterBluePlus.systemDevices([Guid("180F")]);

  Future<void> dispose() async {
    await _scanResultsController.close();
    await _scanResultsSubscription?.cancel();
    await _isScanningController.close();
    await _isScanningSubscription?.cancel();
  }
}
