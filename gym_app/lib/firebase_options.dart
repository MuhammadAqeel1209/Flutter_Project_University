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
    apiKey: 'AIzaSyDIxQVphr3oBvbrS3_f9oo3WTOOZheN2CU',
    appId: '1:79597551109:web:ce88f23d96ec271b41266c',
    messagingSenderId: '79597551109',
    projectId: 'fitnessappuniversity',
    authDomain: 'fitnessappuniversity.firebaseapp.com',
    storageBucket: 'fitnessappuniversity.firebasestorage.app',
    measurementId: 'G-LZ4QYDSYVB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdXcxsrKkPm1rEEA4_O6FPN-M7Lmy0XlY',
    appId: '1:79597551109:android:97ad882fe13c891841266c',
    messagingSenderId: '79597551109',
    projectId: 'fitnessappuniversity',
    storageBucket: 'fitnessappuniversity.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-cyXaCJAlheoQIJ9IMrHJyBGc1t0Y0CU',
    appId: '1:79597551109:ios:c35416d276f249ca41266c',
    messagingSenderId: '79597551109',
    projectId: 'fitnessappuniversity',
    storageBucket: 'fitnessappuniversity.firebasestorage.app',
    iosBundleId: 'com.example.gymApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-cyXaCJAlheoQIJ9IMrHJyBGc1t0Y0CU',
    appId: '1:79597551109:ios:c35416d276f249ca41266c',
    messagingSenderId: '79597551109',
    projectId: 'fitnessappuniversity',
    storageBucket: 'fitnessappuniversity.firebasestorage.app',
    iosBundleId: 'com.example.gymApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIxQVphr3oBvbrS3_f9oo3WTOOZheN2CU',
    appId: '1:79597551109:web:26c5340ee9e8478941266c',
    messagingSenderId: '79597551109',
    projectId: 'fitnessappuniversity',
    authDomain: 'fitnessappuniversity.firebaseapp.com',
    storageBucket: 'fitnessappuniversity.firebasestorage.app',
    measurementId: 'G-F9DRK163XF',
  );
}
