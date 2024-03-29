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
    apiKey: 'AIzaSyBMc2ElxrCeMIdugcy-giRMrJBiuX8BNE0',
    appId: '1:890860547430:web:ce81dc80b23eee356caca7',
    messagingSenderId: '890860547430',
    projectId: 'campvestor',
    authDomain: 'campvestor.firebaseapp.com',
    storageBucket: 'campvestor.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVxWBUM7JqaEpm6kG0r9nv8KtG_yRBfwI',
    appId: '1:890860547430:android:06c943717e39e4206caca7',
    messagingSenderId: '890860547430',
    projectId: 'campvestor',
    storageBucket: 'campvestor.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjnmDdJBqlSdEJ8YjRR4cRg9jESA96AjA',
    appId: '1:890860547430:ios:fb734f09ed30933c6caca7',
    messagingSenderId: '890860547430',
    projectId: 'campvestor',
    storageBucket: 'campvestor.appspot.com',
    iosBundleId: 'com.example.campVestor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjnmDdJBqlSdEJ8YjRR4cRg9jESA96AjA',
    appId: '1:890860547430:ios:f075fd4af89e440f6caca7',
    messagingSenderId: '890860547430',
    projectId: 'campvestor',
    storageBucket: 'campvestor.appspot.com',
    iosBundleId: 'com.example.campVestor.RunnerTests',
  );
}
