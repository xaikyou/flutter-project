part of 'device_connectivity_bloc.dart';

@freezed
class DeviceConnectivityStateData with _$DeviceConnectivityStateData {
  const factory DeviceConnectivityStateData({
    @Default(BluetoothConnectionState.disconnected)
    BluetoothConnectionState connectionState,
    BluetoothService? service,
  }) = _DeviceConnectivityStateData;
}

@freezed
class DeviceConnectivityState with _$DeviceConnectivityState {
  const factory DeviceConnectivityState.deviceConnectivityInitial(
    DeviceConnectivityStateData data,
  ) = _DeviceConnectivityInitial;
  const factory DeviceConnectivityState.deviceConnectivityChanged(
    DeviceConnectivityStateData data,
  ) = DeviceConnectivityChanged;
  const factory DeviceConnectivityState.deviceConnectivityGettingServices(
    DeviceConnectivityStateData data,
  ) = DeviceConnectivityGettingServices;
  const factory DeviceConnectivityState.deviceConnectivityServicesCleared(
    DeviceConnectivityStateData data,
  ) = DeviceConnectivityDeviceServicesCleared;
}
