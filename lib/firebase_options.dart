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
    apiKey: 'AIzaSyAiq4M43QB9OSYGZc3gChXTgyyNhWRfe_Y',
    appId: '1:949136118743:web:bf6c78f205e7e2b377f192',
    messagingSenderId: '949136118743',
    projectId: 'todolistapp-41441',
    authDomain: 'todolistapp-41441.firebaseapp.com',
    storageBucket: 'todolistapp-41441.appspot.com',
    measurementId: 'G-DFNXYY59W6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKNAXwNZS4CIz0702d1byY2ZsqJ9ZhgXk',
    appId: '1:949136118743:android:52d91cc9a14b963c77f192',
    messagingSenderId: '949136118743',
    projectId: 'todolistapp-41441',
    storageBucket: 'todolistapp-41441.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDgOfgPKMENK_EpAPgUzdTmNmC1VsSqcuw',
    appId: '1:949136118743:ios:5006d1bb3c16a47077f192',
    messagingSenderId: '949136118743',
    projectId: 'todolistapp-41441',
    storageBucket: 'todolistapp-41441.appspot.com',
    iosBundleId: 'com.example.todolistApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDgOfgPKMENK_EpAPgUzdTmNmC1VsSqcuw',
    appId: '1:949136118743:ios:5006d1bb3c16a47077f192',
    messagingSenderId: '949136118743',
    projectId: 'todolistapp-41441',
    storageBucket: 'todolistapp-41441.appspot.com',
    iosBundleId: 'com.example.todolistApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAiq4M43QB9OSYGZc3gChXTgyyNhWRfe_Y',
    appId: '1:949136118743:web:d7530c5c104b7fcf77f192',
    messagingSenderId: '949136118743',
    projectId: 'todolistapp-41441',
    authDomain: 'todolistapp-41441.firebaseapp.com',
    storageBucket: 'todolistapp-41441.appspot.com',
    measurementId: 'G-51QB0WW1V5',
  );
}