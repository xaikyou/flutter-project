import 'package:ble_connection/bloc/device_connectivity/device_connectivity_bloc.dart';
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
          }),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Device detail',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
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
                    final services = state.data.services;
                    if (services == null) {
                      return const Text('muahahaha');
                      // return const SizedBox.shrink();
                    }
                    return DeviceServicePage(
                      services: services,
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
  const DeviceServicePage({super.key, required this.services});

  final BluetoothService services;

  @override
  Widget build(BuildContext context) {
    return Text(services.toString());
  }
}
