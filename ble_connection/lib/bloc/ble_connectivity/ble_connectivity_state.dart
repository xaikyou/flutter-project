part of 'ble_connectivity_bloc.dart';

@freezed
class BleConnectivityState with _$BleConnectivityState {
  const factory BleConnectivityState.bleConnectivityInitial() =
      _BleConnectivityInitial;
  const factory BleConnectivityState.bleConnectivityConnected() =
      BleConnectivityConnected;
  const factory BleConnectivityState.bleConnectivityDisconnected() =
      BleConnectivityDisconnected;
}
