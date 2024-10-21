import 'package:ble_connection/bloc/ble_connectivity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BleConnectivityBloc, BleConnectivityState>(
          builder: (context, state) {
            return Column(
              children: [
                Center(
                  child: Text(
                    state ==
                            const BleConnectivityState
                                .bleConnectivityConnected()
                        ? 'Ble Connected'
                        : 'Ble Disconnected',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
