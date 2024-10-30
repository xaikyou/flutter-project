part of 'ble_device_bond_bloc.dart';

@freezed
class BleDeviceBondEvent with _$BleDeviceBondEvent {
  const factory BleDeviceBondEvent.bleDeviceBondStarted() =
      _BleDeviceBondStarted;
  const factory BleDeviceBondEvent.bleDeviceBondWatch() = BleDeviceBondWatch;
}
