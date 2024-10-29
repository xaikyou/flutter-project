import 'package:ble_connection/functions/format_dl_value.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_gatt_characteristic_bloc.freezed.dart';
part 'ble_gatt_characteristic_event.dart';
part 'ble_gatt_characteristic_state.dart';

class BleGattCharacteristicBloc
    extends Bloc<BleGattCharacteristicEvent, BleGattCharacteristicState> {
  final List<BluetoothCharacteristic> characteristics;

  BleGattCharacteristicBloc(this.characteristics)
      : super(const _BleGattCharacteristicInitial(
            BleGattCharacteristicStateData())) {
    on<BleGattCharacteristicEvent>((event, emit) {});
    on<BleGattCharacteristicWatchNotify>(
      (event, emit) async => _onWatchNotify(emit),
    );
    on<BleGattCharacteristicWatchWrite>(
      (event, emit) async => _onWatchWrite(emit),
    );
    on<BleGattCharacteristicWatchRead>(
      (event, emit) async => _onWatchRead(emit),
    );
    on<BleGattCharacteristicOnWrite>(
      (event, emit) async => _onWrite(event.value, emit),
    );
    on<BleGattCharacteristicOnRead>(
      (event, emit) async => _onRead(emit),
    );
    on<BleGattCharacteristicOnIsExecuteUpdated>(
      (event, emit) async => _onUpdateIsExecute,
    );
  }

  Future<void> _onWatchNotify(Emitter<BleGattCharacteristicState> emit) async {
    for (var c in characteristics) {
      if (c.properties.notify) {
        await c.setNotifyValue(true);
        await emit.forEach(c.lastValueStream, onData: (data) {
          debugPrint('=========== NOTIFY ===========');
          final res = FormatDlValue.getEncodeValue(data);
          return BleGattCharacteristicSetNotifyValue(
              state.data.copyWith(value: res));
        });
      }
    }
  }

  Future<void> _onWatchWrite(Emitter<BleGattCharacteristicState> emit) async {
    for (var c in characteristics) {
      if (c.properties.write) {
        await emit.forEach(c.lastValueStream, onData: (data) {
          debugPrint('=========== WRITE ===========');
          final res = FormatDlValue.getEncodeValue(data);
          return BleGattCharacteristicSetWriteValue(
              state.data.copyWith(value: res));
        });
      }
    }
  }

  Future<void> _onWatchRead(Emitter<BleGattCharacteristicState> emit) async {
    for (var c in characteristics) {
      if (c.properties.read) {
        await emit.forEach(c.lastValueStream, onData: (data) {
          debugPrint('=========== READ ===========');
          final res = FormatDlValue.getReadEncodeValue(data);
          return BleGattCharacteristicSetReadValue(
              state.data.copyWith(value: res));
        });
      }
    }
  }

  Future<void> _onWrite(
      String value, Emitter<BleGattCharacteristicState> emit) async {
    for (var c in characteristics) {
      if (c.properties.write) {
        emit(BleGattCharacteristicOnWriteWaiting(
            state.data.copyWith(isExecuteAction: true)));
        try {
          final writeValue = FormatDlValue.formatWriteValue(value);

          await c.write(
            writeValue,
            withoutResponse: c.properties.writeWithoutResponse,
            allowLongWrite: true,
          );
          emit(BleGattCharacteristicOnWriteSuccess(
              state.data.copyWith(isExecuteAction: false)));
        } catch (_) {
          emit(BleGattCharacteristicOnWriteFailed(
              state.data.copyWith(isExecuteAction: false)));
        }
      }
    }
  }

  Future<void> _onRead(Emitter<BleGattCharacteristicState> emit) async {
    for (var c in characteristics) {
      if (c.properties.read) {
        emit(BleGattCharacteristicOnReadWaiting(
            state.data.copyWith(isExecuteAction: true)));
        try {
          await c.read();

          emit(BleGattCharacteristicOnReadSuccess(
              state.data.copyWith(isExecuteAction: false)));
        } catch (_) {
          emit(BleGattCharacteristicOnReadFailed(
              state.data.copyWith(isExecuteAction: false)));
        }
      }
    }
  }

  Future<void> _onUpdateIsExecute(
      Emitter<BleGattCharacteristicState> emit) async {
    emit(BleGattCharacteristicUpdateIsExecute(
        state.data.copyWith(isExecuteAction: false)));
  }
}
