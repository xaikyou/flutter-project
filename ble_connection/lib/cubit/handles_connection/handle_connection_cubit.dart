import 'package:ble_connection/utils/extra.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'handle_connection_cubit.freezed.dart';
part 'handle_connection_state.dart';

class HandleConnectionCubit extends Cubit<HandleConnectionState> {
  HandleConnectionCubit()
      : super(const _HandleConnectionInitial(HandleConnectionStateData()));

  Future<void> handleConnectionToDevice(BluetoothDevice device) async {
    emit(Connecting(
        state.data.copyWith(devices: [...state.data.devices, device])));
    try {
      await device.connectAndUpdateStream();
      emit(Connected(state.data
          .copyWith(devices: [...state.data.devices]..remove(device))));
    } catch (e) {
      emit(ConnectionFailed(state.data
          .copyWith(devices: [...state.data.devices]..remove(device))));
    }
  }

  Future<void> handleCancelConnectionToDevice(BluetoothDevice device) async {
    try {
      await device.disconnectAndUpdateStream(queue: false);
      emit(Disconnected(state.data
          .copyWith(devices: [...state.data.devices]..remove(device))));
    } catch (e) {
      emit(DisconnectionFailed(state.data
          .copyWith(devices: [...state.data.devices]..remove(device))));
    }
  }

  @override
  Future<void> close() async {
    for (var device in state.data.devices) {
      await device.disconnectAndUpdateStream(queue: false);
    }
    return super.close();
  }
}
