import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pushnotification/FirebaseApi.dart';
import 'package:pushnotification/LocalNotification.dart';
import 'package:pushnotification/firebase_options.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  log(message.data.toString());
  // Get.snackbar("gf", "ghhg", backgroundColor: Colors.amber);
  print(message.notification!.title);
  LocalNotificationService.createanddisplaynotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseApi().initial();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.onMessage.listen(
    (message) {
      log("FirebaseMessaging.onMessage.listen");
      if (message.notification != null) {
        LocalNotificationService.createanddisplaynotification(message);
        print(message.notification!.title);
        print(message.notification!.body);
        // Get.snackbar("gf", "ghhg");
        print("message.data11 ${message.data}");
        // LocalNotificationService.display(message);
      }
    },
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
