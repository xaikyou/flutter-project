part of 'handles_connection_cubit.dart';

@freezed
class HandlesConnectionStateData with _$HandlesConnectionStateData {
  const factory HandlesConnectionStateData({
    @Default([]) List<BluetoothDevice> devices,
  }) = _HandlesConnectionStateData;
}

@freezed
class HandlesConnectionState with _$HandlesConnectionState {
  const factory HandlesConnectionState.handlesConnectionInitial(
    HandlesConnectionStateData data,
  ) = _HandlesConnectionInitial;
  const factory HandlesConnectionState.connecting(
    HandlesConnectionStateData data,
  ) = Connecting;
  const factory HandlesConnectionState.connected(
    HandlesConnectionStateData data,
  ) = Connected;
  const factory HandlesConnectionState.connectionFailed(
    HandlesConnectionStateData data,
  ) = ConnectionFailed;
  const factory HandlesConnectionState.disconnecting(
    HandlesConnectionStateData data,
  ) = Disconnecting;
  const factory HandlesConnectionState.disconnected(
    HandlesConnectionStateData data,
  ) = Disconnected;
  const factory HandlesConnectionState.disconnectionFailed(
    HandlesConnectionStateData data,
  ) = DisconnectionFailed;
}
