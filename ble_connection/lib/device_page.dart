import 'package:ble_connection/bloc/ble_gatt_characteristic/ble_gatt_characteristic_bloc.dart';
import 'package:ble_connection/bloc/device_connectivity/device_connectivity_bloc.dart';
import 'package:ble_connection/bloc/enums/dl_notify_code.dart';
import 'package:ble_connection/constants/dl_config_constant.dart';
import 'package:ble_connection/functions/format_dl_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({
    super.key,
    required this.device,
  });

  final BluetoothDevice device;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => DeviceConnectivityBloc(device)
              ..add(const DeviceConnectivityWatching())),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<DeviceConnectivityBloc, DeviceConnectivityState>(
              listener: (context, state) {
            if (state is DeviceConnectivityChanged &&
                state.data.connectionState ==
                    BluetoothConnectionState.connected) {
              context
                  .read<DeviceConnectivityBloc>()
                  .add(const DeviceConnectivityGetServices());
              context
                  .read<DeviceConnectivityBloc>()
                  .add(DeviceConnectivitySaveItemToLocal(device));
            }
            if (state is DeviceConnectivityChanged &&
                state.data.connectionState ==
                    BluetoothConnectionState.disconnected) {
              context
                  .read<DeviceConnectivityBloc>()
                  .add(const DeviceConnectivityClearServices());
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      'Device has disconnected.',
                      style: TextStyle(fontSize: 14),
                    )),
              );
            }
          }),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Device detail',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              BlocBuilder<DeviceConnectivityBloc, DeviceConnectivityState>(
                builder: (context, state) {
                  return CircleAvatar(
                    backgroundColor: state.data.connectionState ==
                            BluetoothConnectionState.connected
                        ? Colors.lightGreen
                        : Colors.red,
                    radius: 8,
                  );
                },
              ),
              BlocBuilder<DeviceConnectivityBloc, DeviceConnectivityState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () => state.data.connectionState ==
                              BluetoothConnectionState.connected
                          ? device.disconnect()
                          : device.connect(),
                      icon: const Icon(
                        Icons.power_settings_new_rounded,
                        size: 24,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  device.platformName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                BlocBuilder<DeviceConnectivityBloc, DeviceConnectivityState>(
                  builder: (context, state) {
                    final services = state.data.service;
                    if (services == null) {
                      return const Center(
                          child: Text('No availabel services.'));
                    }
                    return DeviceServicePage(
                      service: services,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeviceServicePage extends StatelessWidget {
  const DeviceServicePage({super.key, required this.service});

  final BluetoothService service;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BleGattCharacteristicBloc(service.characteristics)
                ..add(const BleGattCharacteristicWatchNotify())
                ..add(const BleGattCharacteristicWatchRead())
                ..add(const BleGattCharacteristicWatchWrite()),
        ),
      ],
      child:
          BlocListener<BleGattCharacteristicBloc, BleGattCharacteristicState>(
        listener: (context, state) {
          if (state is BleGattCharacteristicSetNotifyValue) {
            final value = state.data.value;
            if (value != null && value.isNotEmpty) {
              if (value == CmdCode.LOGIN_OK.toRawValue()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        value,
                        style: const TextStyle(fontSize: 14),
                      )),
                );
              } else {
                String hashValue = FormatDlValue.getHashValue(
                        value + DlConfigConstant.generalCode)
                    .toUpperCase();
                context
                    .read<BleGattCharacteristicBloc>()
                    .add(BleGattCharacteristicOnWrite(hashValue));
              }
            }
          } else {
            debugPrint('EMPTY VALUE');
          }
        },
        child: const Text('muahahaha'),
      ),
    );
  }
}
