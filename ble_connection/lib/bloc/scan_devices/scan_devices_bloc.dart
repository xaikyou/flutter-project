import 'package:ble_connection/service_locator/service_locator.dart';
import 'package:ble_connection/services/ble_scan_device_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_devices_bloc.freezed.dart';
part 'scan_devices_event.dart';
part 'scan_devices_state.dart';

class ScanDevicesBloc extends Bloc<ScanDevicesEvent, ScanDevicesState> {
  final BleScanDeviceService _scanDeviceService;

  ScanDevicesBloc()
      : _scanDeviceService = getIt<BleScanDeviceService>(),
        super(const ScanDevicesInitial(ScanDevicesStateData())) {
    on<ScanDevicesEvent>((event, emit) {});
    on<ScanDevicesStart>(
      (event, emit) async => await _onStartScan(event, emit),
    );
    on<ScanDevicesStop>(
      (event, emit) async => await _onStopScan(event, emit),
    );
    on<ScanDevicesScanning>(
      (event, emit) async => await _onScanningDevices(event, emit),
    );
    on<ScanDevicesCheck>(
      (event, emit) async => await _onCheckingDevices(event, emit),
    );
  }

  Future<void> _onScanningDevices(
      ScanDevicesScanning event, Emitter<ScanDevicesState> emit) async {
    await emit.forEach(_scanDeviceService.scanResults, onData: (data) {
      return ScanDevicesInProgress(
          state.data.copyWith(isScanning: true, scanResults: data));
    });
  }

  Future<void> _onCheckingDevices(
      ScanDevicesCheck event, Emitter<ScanDevicesState> emit) async {
    await emit.forEach(_scanDeviceService.isScanning, onData: (data) {
      if (data) {
        return ScanDevicesInProgress(state.data.copyWith(isScanning: true));
      }
      return ScanDevicesStopped(state.data.copyWith(isScanning: false));
    });
  }

  Future<void> _onStartScan(
      ScanDevicesStart event, Emitter<ScanDevicesState> emit) async {
    try {
      await _scanDeviceService.startScan();
      final connectedDevices = await _scanDeviceService.connectedDevices;

      emit(ScanDevicesInProgress(
          state.data.copyWith(connectedDevices: connectedDevices)));
    } catch (e) {
      emit(ScanDevicesFailure(state.data));
    }
  }

  Future<void> _onStopScan(
      ScanDevicesStop event, Emitter<ScanDevicesState> emit) async {
    try {
      await _scanDeviceService.stopScan();
      emit(ScanDevicesStopped(state.data.copyWith(isScanning: false)));
    } catch (e) {
      emit(ScanDevicesFailure(state.data));
    }
  }

  @override
  Future<void> close() async {
    await _scanDeviceService.stopScan();
    await _scanDeviceService.dispose();
    return super.close();
  }
}
