import 'package:bloc/bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_device_bond_bloc.freezed.dart';
part 'ble_device_bond_event.dart';
part 'ble_device_bond_state.dart';

class BleDeviceBondBloc extends Bloc<BleDeviceBondEvent, BleDeviceBondState> {
  final BluetoothDevice device;
  BleDeviceBondBloc({required this.device})
      : super(const _BleDeviceBondInitial(BleDeviceBondStateData())) {
    on<BleDeviceBondEvent>((event, emit) {});
    on<BleDeviceBondWatch>(
      (event, emit) async => await _onWatchDeviceBond(emit),
    );
  }

  Future<void> _onWatchDeviceBond(Emitter<BleDeviceBondState> emit) async {
    await emit.forEach(device.bondState, onData: (data) {
      return BleDeviceBondUpdateState(state.data.copyWith(bondState: data));
    });
  }
}
