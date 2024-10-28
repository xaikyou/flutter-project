part of 'scan_devices_bloc.dart';

@freezed
class ScanDevicesStateData with _$ScanDevicesStateData {
  const factory ScanDevicesStateData({
    @Default(false) bool isScanning,
    @Default([]) List<ScanResult> scanResults,
    @Default([]) List<BluetoothDevice> connectedDevices,
  }) = _ScanDevicesStateData;
}

@freezed
class ScanDevicesState with _$ScanDevicesState {
  const factory ScanDevicesState.scanDevicesInitial(ScanDevicesStateData data) =
      ScanDevicesInitial;
  const factory ScanDevicesState.scanDevicesInProgress(
      ScanDevicesStateData data) = ScanDevicesInProgress;
  const factory ScanDevicesState.scanDevicesUpdated(ScanDevicesStateData data) =
      ScanDevicesUpdated;
  const factory ScanDevicesState.scanDevicesStopped(ScanDevicesStateData data) =
      ScanDevicesStopped;
  const factory ScanDevicesState.scanDevicesFailure(ScanDevicesStateData data) =
      ScanDevicesFailure;
}
