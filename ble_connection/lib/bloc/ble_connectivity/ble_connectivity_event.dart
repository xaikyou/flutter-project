part of 'ble_connectivity_bloc.dart';

@freezed
class BleConnectivityEvent with _$BleConnectivityEvent {
  const factory BleConnectivityEvent.bleConnectivityStarted() =
      _BleConnectivityStarted;
  const factory BleConnectivityEvent.bleConnectivityWatch() =
      BleConnectivityWatch;
  const factory BleConnectivityEvent.bleConnectivityCheck() =
      BleConnectivityCheck;
}
