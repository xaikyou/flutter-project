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
            fontSize: 16,
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

  Widget _showScanResults(List<ScanResult> results) {
    return Material(
      color: Colors.transparent,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: results.length,
        itemBuilder: (context, index) {
          if (results[index].advertisementData.connectable == false ||
              results[index].device.platformName.isEmpty) {
            return const SizedBox.shrink();
          }

          String title = results[index].device.platformName;
          return ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(
                  color: Colors.black,
                  width: 1,
                )),
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.only(left: 8),
            title: Text(
              title,
              style: const TextStyle(fontSize: 20),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: SizedBox(
              height: double.infinity,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'CONNECT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.transparent,
          height: 0.25,
        ),
      ),
    );
  }
}
