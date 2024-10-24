import 'package:ble_connection/bloc/ble_connectivity/ble_connectivity_bloc.dart';
import 'package:ble_connection/bloc/scan_devices/scan_devices_bloc.dart';
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
    return BlocProvider(
      create: (context) => ScanDevicesBloc()
        ..add(const ScanDevicesScanning())
        ..add(const ScanDevicesCheck()),
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
                    const SizedBox(height: 24),
                    _checkConnectionStatus(isConencted),

                    /// Open Ble Button
                    const SizedBox(height: 24),
                    _openBleButton(isConencted),

                    /// Scan Button
                    const SizedBox(height: 24),
                    _scanButton(isConencted),

                    /// Show Devices Scanned
                    const SizedBox(height: 24),
                    BlocBuilder<ScanDevicesBloc, ScanDevicesState>(
                      builder: (context, state) {
                        return Expanded(
                            child: _showScanResults(state.data.scanResults));
                      },
                    ),
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
          'State: ',
          style: TextStyle(
            fontSize: 24,
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
              backgroundColor: Colors.blueAccent,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Start Scan',
                style: TextStyle(
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

  Widget _showScanResults(List<ScanResult> results) {
    return Material(
      color: Colors.transparent,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: results.length,
        itemBuilder: (context, index) {
          String title = results[index].device.remoteId.str;
          return ListTile(
            title: Text(title, style: const TextStyle(fontSize: 20)),
            tileColor: index % 2 == 0 ? Colors.blueGrey.shade100 : Colors.white,
          );
        },
      ),
    );
  }
}
