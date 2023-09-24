import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebase = FirebaseMessaging.instance;
  initial() async {
    await _firebase.requestPermission(
        alert: true,
        sound: true,
        badge: true,
        announcement: true,
        carPlay: true,
        provisional: true,
        criticalAlert: true);
    await _firebase.getToken().then((value) {
      log(value.toString());
    });
    // RemoteMessage? initialMessage =
    //     await FirebaseMessaging.instance.getInitialMessage();
    // if (initialMessage != null) {
    //   log("message");
    // }
    // await _firebase.
  }
}
