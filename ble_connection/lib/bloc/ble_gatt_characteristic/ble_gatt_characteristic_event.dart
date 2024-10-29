part of 'ble_gatt_characteristic_bloc.dart';

@freezed
class BleGattCharacteristicEvent with _$BleGattCharacteristicEvent {
  const factory BleGattCharacteristicEvent.bleGattCharacteristicStarted() =
      _BleGattCharacteristicStarted;

  const factory BleGattCharacteristicEvent.bleGattCharacteristicWatchNotify() =
      BleGattCharacteristicWatchNotify;
  const factory BleGattCharacteristicEvent.bleGattCharacteristicWatchWrite() =
      BleGattCharacteristicWatchWrite;
  const factory BleGattCharacteristicEvent.bleGattCharacteristicWatchRead() =
      BleGattCharacteristicWatchRead;

  const factory BleGattCharacteristicEvent.bleGattCharacteristicOnWrite(
    String value,
  ) = BleGattCharacteristicOnWrite;
  const factory BleGattCharacteristicEvent.bleGattCharacteristicOnRead() =
      BleGattCharacteristicOnRead;
  const factory BleGattCharacteristicEvent.bleGattCharacteristicOnIsExecuteUpdated() =
      BleGattCharacteristicOnIsExecuteUpdated;
}
