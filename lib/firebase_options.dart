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
    apiKey: 'AIzaSyB8Jme27K6o_KzB8Ys-uR8npzB_k1yqNiY',
    appId: '1:30216471887:web:7dea094d005c07d5e0b13a',
    messagingSenderId: '30216471887',
    projectId: 'witogov',
    authDomain: 'witogov.firebaseapp.com',
    databaseURL: 'https://witogov-default-rtdb.firebaseio.com',
    storageBucket: 'witogov.appspot.com',
    measurementId: 'G-0QKTMZXZFG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVWEDBVU8kt-M4mUNuayxR-_ItWMgJiBw',
    appId: '1:30216471887:android:b16f2f4096c11dd8e0b13a',
    messagingSenderId: '30216471887',
    projectId: 'witogov',
    databaseURL: 'https://witogov-default-rtdb.firebaseio.com',
    storageBucket: 'witogov.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0UhlVXSgBHZx0re-C0SUWcxfEgvvosvQ',
    appId: '1:30216471887:ios:e451ef8077763d4de0b13a',
    messagingSenderId: '30216471887',
    projectId: 'witogov',
    databaseURL: 'https://witogov-default-rtdb.firebaseio.com',
    storageBucket: 'witogov.appspot.com',
    iosBundleId: 'com.example.witoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0UhlVXSgBHZx0re-C0SUWcxfEgvvosvQ',
    appId: '1:30216471887:ios:b54ffbf98a01f8dce0b13a',
    messagingSenderId: '30216471887',
    projectId: 'witogov',
    databaseURL: 'https://witogov-default-rtdb.firebaseio.com',
    storageBucket: 'witogov.appspot.com',
    iosBundleId: 'com.example.witoApp.RunnerTests',
  );
}
