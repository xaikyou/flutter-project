import 'package:ble_connection/constants/dl_config_constant.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_connectivity_bloc.freezed.dart';
part 'device_connectivity_event.dart';
part 'device_connectivity_state.dart';

class DeviceConnectivityBloc
    extends Bloc<DeviceConnectivityEvent, DeviceConnectivityState> {
  final BluetoothDevice device;

  DeviceConnectivityBloc(this.device)
      : super(const _DeviceConnectivityInitial(DeviceConnectivityStateData())) {
    on<DeviceConnectivityEvent>((event, emit) {});
    on<DeviceConnectivityWatching>(
      (event, emit) async {
        await _onWatchDeviceConnectivity(event, emit);
      },
      transformer: concurrent(),
    );
    on<DeviceConnectivityGetServices>(
      (event, emit) async {
        await _onGetService(event, emit);
      },
    );
    on<DeviceConnectivityClearServices>(
      (event, emit) async {
        await _onClearService(event, emit);
      },
    );
  }

  Future<void> _onWatchDeviceConnectivity(DeviceConnectivityWatching event,
      Emitter<DeviceConnectivityState> emit) async {
    await emit.forEach(device.connectionState,
        onData: (data) => DeviceConnectivityChanged(
            state.data.copyWith(connectionState: data)));
  }

  Future<void> _onGetService(DeviceConnectivityGetServices event,
      Emitter<DeviceConnectivityState> emit) async {
    try {
      final services = await device.discoverServices();
      emit(DeviceConnectivityGettingServices(state.data.copyWith(
          service: services.firstWhere(
        (s) => s.serviceUuid.toString() == DlConfigConstant.serviceId,
      ))));
    } catch (_) {}
  }

  Future<void> _onClearService(DeviceConnectivityClearServices event,
      Emitter<DeviceConnectivityState> emit) async {
    emit(
      DeviceConnectivityDeviceServicesCleared(
          state.data.copyWith(service: null)),
    );
  }
}
