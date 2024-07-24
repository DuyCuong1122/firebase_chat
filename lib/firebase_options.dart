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
    apiKey: 'AIzaSyAI9ApQYbcL-mDJfe2ORvN97PBh9NE-aBM',
    appId: '1:1010239918726:web:98925d8d4c5e9e2965f707',
    messagingSenderId: '1010239918726',
    projectId: 'flutter-chat-app-9d9a5',
    authDomain: 'flutter-chat-app-9d9a5.firebaseapp.com',
    storageBucket: 'flutter-chat-app-9d9a5.appspot.com',
    measurementId: 'G-RPNC39TYPF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7zZzWIUK7M7w7wCN0CVLQZIV91lleCu4',
    appId: '1:1010239918726:android:41a1484584ae02e665f707',
    messagingSenderId: '1010239918726',
    projectId: 'flutter-chat-app-9d9a5',
    storageBucket: 'flutter-chat-app-9d9a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8Bh5isUlptwMH1HrQyzoGkEktGmBXRPs',
    appId: '1:1010239918726:ios:5643498dc2a692f965f707',
    messagingSenderId: '1010239918726',
    projectId: 'flutter-chat-app-9d9a5',
    storageBucket: 'flutter-chat-app-9d9a5.appspot.com',
    iosClientId: '1010239918726-4gkojslprlt46ipk88c6db6s76hgsjfs.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8Bh5isUlptwMH1HrQyzoGkEktGmBXRPs',
    appId: '1:1010239918726:ios:6bfdd0e71bc392f765f707',
    messagingSenderId: '1010239918726',
    projectId: 'flutter-chat-app-9d9a5',
    storageBucket: 'flutter-chat-app-9d9a5.appspot.com',
    iosClientId: '1010239918726-096vktbf177r6g61np75qtrjk7jl93o6.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseChat.RunnerTests',
  );
}