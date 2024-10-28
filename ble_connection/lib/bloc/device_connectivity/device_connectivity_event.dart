part of 'device_connectivity_bloc.dart';

@freezed
class DeviceConnectivityEvent with _$DeviceConnectivityEvent {
  const factory DeviceConnectivityEvent.deviceConnectivityStarted() =
      _DeviceConnectivityStarted;
  const factory DeviceConnectivityEvent.deviceConnectivityWatching() =
      DeviceConnectivityWatching;
  const factory DeviceConnectivityEvent.deviceConnectivityGetServices() =
      DeviceConnectivityGetServices;
  const factory DeviceConnectivityEvent.deviceConnectivityClearServices() =
      DeviceConnectivityClearServices;
  const factory DeviceConnectivityEvent.deviceConnectivitySaveItemToLocal(
    BluetoothDevice device,
  ) = DeviceConnectivitySaveItemToLocal;
}
