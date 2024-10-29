import 'package:ble_connection/bloc/ble_connectivity/ble_connectivity_bloc.dart';
import 'package:ble_connection/bloc/device_connectivity/device_connectivity_bloc.dart';
import 'package:ble_connection/bloc/scan_devices/scan_devices_bloc.dart';
import 'package:ble_connection/cubit/handles_connection/handles_connection_cubit.dart';
import 'package:ble_connection/device_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScanDevicesBloc()
            ..add(const ScanDevicesScanning())
            ..add(const ScanDevicesCheck()),
        ),
        BlocProvider(create: (context) => HandlesConnectionCubit()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<BleConnectivityBloc, BleConnectivityState>(
            builder: (context, state) {
              bool isConencted =
                  state == const BleConnectivityState.bleConnectivityConnected()
                      ? true
                      : false;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    /// Connection State
                    const SizedBox(height: 16),
                    _checkConnectionStatus(isConencted),

                    /// Open Ble Button
                    const SizedBox(height: 16),
                    _openBleButton(isConencted),

                    /// Scan Button
                    const SizedBox(height: 16),
                    _scanButton(isConencted),

                    /// Show Devices Scanned
                    const SizedBox(height: 16),
                    _buildDeviceTiles(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _checkConnectionStatus(bool state) {
    return Row(
      children: [
        const Text(
          'Status: ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          state ? 'Connected' : 'Disconnected',
          style: TextStyle(
            fontSize: 24,
            color: state ? Colors.green : Colors.redAccent,
          ),
        ),
      ],
    );
  }

  Widget _openBleButton(bool status) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: FilledButton(
        onPressed: status == false
            ? () => context.read<BleConnectivityBloc>().openBle()
            : null,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.blueAccent,
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Enable Bluetooth',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _scanButton(bool status) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: BlocBuilder<ScanDevicesBloc, ScanDevicesState>(
        builder: (context, state) {
          final isScanning = state.data.isScanning;

          return FilledButton(
            onPressed: status
                ? () {
                    context.read<ScanDevicesBloc>().add(isScanning
                        ? const ScanDevicesStop()
                        : const ScanDevicesStart());
                  }
                : null,
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              backgroundColor: isScanning ? Colors.red : Colors.blueAccent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                isScanning ? 'Stop Scan' : 'Start Scan',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onConnectPressed(BuildContext context, BluetoothDevice device) async {
    context.read<HandlesConnectionCubit>().handleConnectionToDevice(device);
  }

  Widget _buildDeviceTiles() {
    return BlocBuilder<ScanDevicesBloc, ScanDevicesState>(
      builder: (context, state) {
        return Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ..._buildSystemDeviceTiles(context, state.data.connectedDevices),
              ..._buildScanResultTiles(context, state.data.scanResults),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildSystemDeviceTiles(
      BuildContext context, List<BluetoothDevice> systemDevices) {
    return systemDevices
        .map((d) => BlocProvider(
              create: (context) {
                final bloc = DeviceConnectivityBloc(d);
                bloc.add(const DeviceConnectivityWatching());
                return bloc;
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  d.platformName,
                  style: const TextStyle(fontSize: 20, color: Colors.redAccent),
                ),
                subtitle: const Text(
                  'Connected',
                  style: TextStyle(fontSize: 16, color: Colors.redAccent),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DevicePage(
                            device: d,
                          )),
                ),
              ),
            ))
        .toList();
  }

  List<Widget> _buildScanResultTiles(
      BuildContext context, List<ScanResult> results) {
    return results
        .map(
          (r) => r.advertisementData.connectable == true &&
                  r.device.platformName.isNotEmpty
              ? BlocProvider(
                  create: (context) => DeviceConnectivityBloc(r.device)
                    ..add(const DeviceConnectivityWatching()),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      r.device.platformName,
                      style: const TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      _onConnectPressed(context, r.device);
                    },
                  ),
                )
              : const SizedBox.shrink(),
        )
        .toList();
  }
}
