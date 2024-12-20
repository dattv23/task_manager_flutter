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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCV7wmi-zJvBfg0oXDv7dXFb-V6SqhOc0M',
    appId: '1:798130125803:web:1fa812d8e44945a344f7ae',
    messagingSenderId: '798130125803',
    projectId: 'todo-app-d4904',
    authDomain: 'todo-app-d4904.firebaseapp.com',
    storageBucket: 'todo-app-d4904.firebasestorage.app',
    measurementId: 'G-J7SZK73LYB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBB0I0BAhZwX0yAhg2b7O3A0fhfIkUaoBw',
    appId: '1:798130125803:android:4d6e0f638eb8ca5644f7ae',
    messagingSenderId: '798130125803',
    projectId: 'todo-app-d4904',
    storageBucket: 'todo-app-d4904.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAsyaEyAq2lQN56nAs9Bv-4aP0H13Q-mSY',
    appId: '1:798130125803:ios:922393cf5443e4bd44f7ae',
    messagingSenderId: '798130125803',
    projectId: 'todo-app-d4904',
    storageBucket: 'todo-app-d4904.firebasestorage.app',
    iosBundleId: 'com.example.taskManager',
  );
}
