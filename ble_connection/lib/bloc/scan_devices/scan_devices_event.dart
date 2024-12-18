part of 'scan_devices_bloc.dart';

@freezed
class ScanDevicesEvent with _$ScanDevicesEvent {
  const factory ScanDevicesEvent.scanDevicesStart() = ScanDevicesStart;
  const factory ScanDevicesEvent.scanDevicesScanning() = ScanDevicesScanning;
  const factory ScanDevicesEvent.scanDevicesStop() = ScanDevicesStop;
  const factory ScanDevicesEvent.scanDevicesCheck() = ScanDevicesCheck;
  const factory ScanDevicesEvent.scanDevicesUpdate({
    required List<ScanResult> results,
    required List<BluetoothDevice> devices,
  }) = ScanDevicesUpdate;
}
