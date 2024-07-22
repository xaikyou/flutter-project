// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCCHhHN967MjbgP_LDw_Uuq8maJ2Zm908w',
    appId: '1:417643830593:web:0036987c518bb34368d5c0',
    messagingSenderId: '417643830593',
    projectId: 'authentication-flutter-90bc7',
    authDomain: 'authentication-flutter-90bc7.firebaseapp.com',
    storageBucket: 'authentication-flutter-90bc7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYhHgWJ73m1C0ElfP1bOkiirdJVB1PS84',
    appId: '1:417643830593:android:94014f1eccb108c768d5c0',
    messagingSenderId: '417643830593',
    projectId: 'authentication-flutter-90bc7',
    storageBucket: 'authentication-flutter-90bc7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpAq2QsJcNwkqde7R4R4AoMiLBCnCYH_s',
    appId: '1:417643830593:ios:0c71655102d61abb68d5c0',
    messagingSenderId: '417643830593',
    projectId: 'authentication-flutter-90bc7',
    storageBucket: 'authentication-flutter-90bc7.appspot.com',
    iosBundleId: 'com.example.cubitLogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpAq2QsJcNwkqde7R4R4AoMiLBCnCYH_s',
    appId: '1:417643830593:ios:0c71655102d61abb68d5c0',
    messagingSenderId: '417643830593',
    projectId: 'authentication-flutter-90bc7',
    storageBucket: 'authentication-flutter-90bc7.appspot.com',
    iosBundleId: 'com.example.cubitLogin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCCHhHN967MjbgP_LDw_Uuq8maJ2Zm908w',
    appId: '1:417643830593:web:c0302047a852d24e68d5c0',
    messagingSenderId: '417643830593',
    projectId: 'authentication-flutter-90bc7',
    authDomain: 'authentication-flutter-90bc7.firebaseapp.com',
    storageBucket: 'authentication-flutter-90bc7.appspot.com',
  );
}