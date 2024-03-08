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
    apiKey: 'AIzaSyB3MExW281Q8LnodfN2QJmhp4Ub03mO9Mc',
    appId: '1:995176526066:web:b0a184a54a0fdc18e7e06b',
    messagingSenderId: '995176526066',
    projectId: 'codejam2-flutter-smiu',
    authDomain: 'codejam2-flutter-smiu.firebaseapp.com',
    storageBucket: 'codejam2-flutter-smiu.appspot.com',
    measurementId: 'G-YCVLCF0EEP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWLijplCAoUDb75wNAD13bNa38EuCPu5M',
    appId: '1:995176526066:android:265663e709b4a020e7e06b',
    messagingSenderId: '995176526066',
    projectId: 'codejam2-flutter-smiu',
    storageBucket: 'codejam2-flutter-smiu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA02cgjJnLMHwiXyxSGSCuHSZKgPI8ExAs',
    appId: '1:995176526066:ios:0da01bb80c2af35ce7e06b',
    messagingSenderId: '995176526066',
    projectId: 'codejam2-flutter-smiu',
    storageBucket: 'codejam2-flutter-smiu.appspot.com',
    iosBundleId: 'com.example.flutterRevision',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA02cgjJnLMHwiXyxSGSCuHSZKgPI8ExAs',
    appId: '1:995176526066:ios:937c45f4112a5e3de7e06b',
    messagingSenderId: '995176526066',
    projectId: 'codejam2-flutter-smiu',
    storageBucket: 'codejam2-flutter-smiu.appspot.com',
    iosBundleId: 'com.example.flutterRevision.RunnerTests',
  );
}