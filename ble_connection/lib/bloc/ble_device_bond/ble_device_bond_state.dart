part of 'ble_device_bond_bloc.dart';

@freezed
class BleDeviceBondStateData with _$BleDeviceBondStateData {
  const factory BleDeviceBondStateData({
    @Default(BluetoothBondState.none) BluetoothBondState bondState,
  }) = _BleDeviceBondStateData;
}

@freezed
class BleDeviceBondState with _$BleDeviceBondState {
  const factory BleDeviceBondState.bleDeviceBondInitial(
      BleDeviceBondStateData data) = _BleDeviceBondInitial;
  const factory BleDeviceBondState.bleDeviceBondUpdateState(
      BleDeviceBondStateData data) = BleDeviceBondUpdateState;
}
