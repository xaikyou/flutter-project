part of 'handle_connection_cubit.dart';

@freezed
class HandleConnectionStateData with _$HandleConnectionStateData {
  const factory HandleConnectionStateData({
    @Default([]) List<BluetoothDevice> devices,
  }) = _HandleConnectionStateData;
}

@freezed
class HandleConnectionState with _$HandleConnectionState {
  const factory HandleConnectionState.handleConnectionInitial(
    HandleConnectionStateData data,
  ) = _HandleConnectionInitial;
  const factory HandleConnectionState.connecting(
    HandleConnectionStateData data,
  ) = Connecting;
  const factory HandleConnectionState.connected(
    HandleConnectionStateData data,
  ) = Connected;
  const factory HandleConnectionState.connectionFailed(
    HandleConnectionStateData data,
  ) = ConnectionFailed;
  const factory HandleConnectionState.disconnecting(
    HandleConnectionStateData data,
  ) = Disconnecting;
  const factory HandleConnectionState.disconnected(
    HandleConnectionStateData data,
  ) = Disconnected;
  const factory HandleConnectionState.disconnectionFailed(
    HandleConnectionStateData data,
  ) = DisconnectionFailed;
}
