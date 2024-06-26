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
    apiKey: 'AIzaSyDnyyM0QZzxL5bcbqLL34vcK3_6Nkw4jrQ',
    appId: '1:1057168250517:web:43308f5afd67efec64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    authDomain: 'tele-doc-ed764.firebaseapp.com',
    storageBucket: 'tele-doc-ed764.appspot.com',
    measurementId: 'G-P2MRZZQ805',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHPB8HjPsxaRN8BQDCbrGQyxlGDG0nxJY',
    appId: '1:1057168250517:android:01197df915d9a40f64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    storageBucket: 'tele-doc-ed764.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGlYnq7kLUn_KNV8lEyJFlbeyt_RclUpc',
    appId: '1:1057168250517:ios:6674ac1ed6515fba64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    storageBucket: 'tele-doc-ed764.appspot.com',
    iosClientId: '1057168250517-svi024qjjetn5jh5313hvjhm4g76g139.apps.googleusercontent.com',
    iosBundleId: 'com.example.deledocdoctor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGlYnq7kLUn_KNV8lEyJFlbeyt_RclUpc',
    appId: '1:1057168250517:ios:6674ac1ed6515fba64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    storageBucket: 'tele-doc-ed764.appspot.com',
    iosClientId: '1057168250517-svi024qjjetn5jh5313hvjhm4g76g139.apps.googleusercontent.com',
    iosBundleId: 'com.example.deledocdoctor',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDnyyM0QZzxL5bcbqLL34vcK3_6Nkw4jrQ',
    appId: '1:1057168250517:web:28323a470d378e5b64ad9c',
    messagingSenderId: '1057168250517',
    projectId: 'tele-doc-ed764',
    authDomain: 'tele-doc-ed764.firebaseapp.com',
    storageBucket: 'tele-doc-ed764.appspot.com',
    measurementId: 'G-LD1MZ4WL2F',
  );
}
