import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class Snackbar {
  static final snackBarKey = GlobalKey<ScaffoldMessengerState>();

  static void show(String msg, {required bool success}) {
    final snackBar = SnackBar(
      content: Text(msg),
      backgroundColor: success ? Colors.blue : Colors.red,
    );
    snackBarKey.currentState?.removeCurrentSnackBar();
    snackBarKey.currentState?.showSnackBar(snackBar);
  }
}

String prettyException(String prefix, dynamic e) {
  if (e is FlutterBluePlusException) {
    return "$prefix ${e.description}";
  } else if (e is PlatformException) {
    return "$prefix ${e.message}";
  }
  return prefix + e.toString();
}
