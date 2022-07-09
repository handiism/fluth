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
    apiKey: 'AIzaSyBuCcKjuB3J983lNBNYmpbbDZ2n9n5Wzls',
    appId: '1:296564222407:web:78c98753a69a5b927ed1e2',
    messagingSenderId: '296564222407',
    projectId: 'auth-app-246ee',
    authDomain: 'auth-app-246ee.firebaseapp.com',
    storageBucket: 'auth-app-246ee.appspot.com',
    measurementId: 'G-VWD6FS5PKQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDI-28xPiyEnE9JfzAzXCLgtdQR0rQXG8Y',
    appId: '1:296564222407:android:285325e915fda4527ed1e2',
    messagingSenderId: '296564222407',
    projectId: 'auth-app-246ee',
    storageBucket: 'auth-app-246ee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_hKPpMOSFDZh3ILmjVEExxkKdRa1AfEs',
    appId: '1:296564222407:ios:9e8ab10aeae812647ed1e2',
    messagingSenderId: '296564222407',
    projectId: 'auth-app-246ee',
    storageBucket: 'auth-app-246ee.appspot.com',
    iosClientId: '296564222407-dfpri932i9b2566c0369gu8hsct6frnl.apps.googleusercontent.com',
    iosBundleId: 'com.example.fluth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_hKPpMOSFDZh3ILmjVEExxkKdRa1AfEs',
    appId: '1:296564222407:ios:9e8ab10aeae812647ed1e2',
    messagingSenderId: '296564222407',
    projectId: 'auth-app-246ee',
    storageBucket: 'auth-app-246ee.appspot.com',
    iosClientId: '296564222407-dfpri932i9b2566c0369gu8hsct6frnl.apps.googleusercontent.com',
    iosBundleId: 'com.example.fluth',
  );
}
