import 'package:ble_connection/service_locator/service_locator.dart';
import 'package:ble_connection/services/ble_connectivity_service.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_connectivity_bloc.freezed.dart';
part 'ble_connectivity_event.dart';
part 'ble_connectivity_state.dart';

class BleConnectivityBloc
    extends Bloc<BleConnectivityEvent, BleConnectivityState> {
  final BleConnectivityService _bleConnectivityService;

  BleConnectivityBloc()
      : _bleConnectivityService = getIt<BleConnectivityService>(),
        super(const _BleConnectivityInitial()) {
    on<BleConnectivityEvent>((event, emit) {});
    on<BleConnectivityWatch>(
      (event, emit) async => await _checkConnectionStatus(emit),
    );
    on<BleConnectivityCheck>(
      (event, emit) async => await _checkConnectivity(emit),
    );
  }

  Future<void> _checkConnectionStatus(
      Emitter<BleConnectivityState> emit) async {
    await emit.forEach(
      _bleConnectivityService.onBleChanged,
      onData: (bool value) => value
          ? const BleConnectivityConnected()
          : const BleConnectivityDisconnected(),
    );
  }

  Future<void> _checkConnectivity(Emitter<BleConnectivityState> emit) async {
    bool isBleConnected = await _bleConnectivityService.isBleConnected;
    emit(
      isBleConnected
          ? const BleConnectivityConnected()
          : const BleConnectivityDisconnected(),
    );
  }

  Future<void> openBle() async {
    await _bleConnectivityService.openBle();
  }

  @override
  Future<void> close() {
    _bleConnectivityService.dispose();
    return super.close();
  }
}
