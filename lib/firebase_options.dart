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
    apiKey: 'AIzaSyC0hzg9tL5Zi06PggJb64ZNQi-GcHxXP1I',
    appId: '1:228154527786:web:a8c2a6e01583fb7667b353',
    messagingSenderId: '228154527786',
    projectId: 'saba-fashion-store',
    authDomain: 'saba-fashion-store.firebaseapp.com',
    storageBucket: 'saba-fashion-store.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNmhI_N1DIZkzS2JdVXCREe38cYc6cxUs',
    appId: '1:228154527786:android:e1406b9e794c081767b353',
    messagingSenderId: '228154527786',
    projectId: 'saba-fashion-store',
    storageBucket: 'saba-fashion-store.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjhLuhDD03yT0dM8LjQtHeQin3z8utpoc',
    appId: '1:228154527786:ios:eb5b442e3df1f8b067b353',
    messagingSenderId: '228154527786',
    projectId: 'saba-fashion-store',
    storageBucket: 'saba-fashion-store.appspot.com',
    iosClientId: '228154527786-f30snciv68v03gdj6va4ce208ojt45o6.apps.googleusercontent.com',
    iosBundleId: 'com.example.sabaFashionStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjhLuhDD03yT0dM8LjQtHeQin3z8utpoc',
    appId: '1:228154527786:ios:eb5b442e3df1f8b067b353',
    messagingSenderId: '228154527786',
    projectId: 'saba-fashion-store',
    storageBucket: 'saba-fashion-store.appspot.com',
    iosClientId: '228154527786-f30snciv68v03gdj6va4ce208ojt45o6.apps.googleusercontent.com',
    iosBundleId: 'com.example.sabaFashionStore',
  );
}
