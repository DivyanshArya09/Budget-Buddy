// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyADL27Q8dG879bOmz3Bpnx3RYaXCI8aKRE',
    appId: '1:500897420755:web:da25d1d22d2ce19e264b26',
    messagingSenderId: '500897420755',
    projectId: 'cipherxexpensetracker',
    authDomain: 'cipherxexpensetracker.firebaseapp.com',
    storageBucket: 'cipherxexpensetracker.appspot.com',
    measurementId: 'G-HG5ZX3B91P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCES5MAkaIF8wx1oMF_3zb8B_jLMlyDgA8',
    appId: '1:500897420755:android:6e5a99939196b9c8264b26',
    messagingSenderId: '500897420755',
    projectId: 'cipherxexpensetracker',
    storageBucket: 'cipherxexpensetracker.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbMNCvCQ2rjj7d5dZ_RAnCr3JqBTcBDlg',
    appId: '1:500897420755:ios:e4589dc407d59b5e264b26',
    messagingSenderId: '500897420755',
    projectId: 'cipherxexpensetracker',
    storageBucket: 'cipherxexpensetracker.appspot.com',
    iosBundleId: 'com.example.cipherxExpenseTrackerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbMNCvCQ2rjj7d5dZ_RAnCr3JqBTcBDlg',
    appId: '1:500897420755:ios:65b85b1ba98e524d264b26',
    messagingSenderId: '500897420755',
    projectId: 'cipherxexpensetracker',
    storageBucket: 'cipherxexpensetracker.appspot.com',
    iosBundleId: 'com.example.cipherxExpenseTrackerApp.RunnerTests',
  );
}
