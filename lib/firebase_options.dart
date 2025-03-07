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
    apiKey: 'AIzaSyC35_zvnJNAOZAKs-T38Bj8oaRV5d5uBX8',
    appId: '1:565896011608:web:349f72cbbe636d61ca4f2d',
    messagingSenderId: '565896011608',
    projectId: 'fir-crud-f4b90',
    authDomain: 'fir-crud-f4b90.firebaseapp.com',
    storageBucket: 'fir-crud-f4b90.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfY6R85QPg6x016xQTx-ScvKg8w9E12eU',
    appId: '1:565896011608:android:aaa705ad09dc1274ca4f2d',
    messagingSenderId: '565896011608',
    projectId: 'fir-crud-f4b90',
    storageBucket: 'fir-crud-f4b90.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdD9rH7lqV65Wf_hVK3ecINdjbjidztOI',
    appId: '1:565896011608:ios:826ac670fa3deb70ca4f2d',
    messagingSenderId: '565896011608',
    projectId: 'fir-crud-f4b90',
    storageBucket: 'fir-crud-f4b90.appspot.com',
    iosBundleId: 'com.firebasecrud.firebasecurd',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBdD9rH7lqV65Wf_hVK3ecINdjbjidztOI',
    appId: '1:565896011608:ios:826ac670fa3deb70ca4f2d',
    messagingSenderId: '565896011608',
    projectId: 'fir-crud-f4b90',
    storageBucket: 'fir-crud-f4b90.appspot.com',
    iosBundleId: 'com.firebasecrud.firebasecurd',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC35_zvnJNAOZAKs-T38Bj8oaRV5d5uBX8',
    appId: '1:565896011608:web:607598e637891834ca4f2d',
    messagingSenderId: '565896011608',
    projectId: 'fir-crud-f4b90',
    authDomain: 'fir-crud-f4b90.firebaseapp.com',
    storageBucket: 'fir-crud-f4b90.appspot.com',
  );
}
