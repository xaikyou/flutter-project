part of 'ble_gatt_characteristic_bloc.dart';

@freezed
class BleGattCharacteristicStateData with _$BleGattCharacteristicStateData {
  const factory BleGattCharacteristicStateData({
    String? value,
    @Default(false) bool isExecuteAction,
  }) = _BleGattCharacteristicStateData;
}

@freezed
class BleGattCharacteristicState with _$BleGattCharacteristicState {
  const factory BleGattCharacteristicState.initial(
    BleGattCharacteristicStateData data,
  ) = _BleGattCharacteristicInitial;

  const factory BleGattCharacteristicState.bleGattCharacteristicSetNotifyValue(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicSetNotifyValue;
  const factory BleGattCharacteristicState.bleGattCharacteristicSetWriteValue(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicSetWriteValue;
  const factory BleGattCharacteristicState.bleGattCharacteristicSetReadValue(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicSetReadValue;

  const factory BleGattCharacteristicState.bleGattCharacteristicOnWriteWaiting(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicOnWriteWaiting;
  const factory BleGattCharacteristicState.bleGattCharacteristicOnWriteSuccess(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicOnWriteSuccess;
  const factory BleGattCharacteristicState.bleGattCharacteristicOnWriteFailed(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicOnWriteFailed;

  const factory BleGattCharacteristicState.bleGattCharacteristicOnReadWaiting(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicOnReadWaiting;
  const factory BleGattCharacteristicState.bleGattCharacteristicOnReadSuccess(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicOnReadSuccess;
  const factory BleGattCharacteristicState.bleGattCharacteristicOnReadFailed(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicOnReadFailed;

  const factory BleGattCharacteristicState.bleGattCharacteristicUpdateIsExecute(
    BleGattCharacteristicStateData data,
  ) = BleGattCharacteristicUpdateIsExecute;
}
