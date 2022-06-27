import 'dart:async';
import 'dart:typed_data';

import 'package:boppo_stream/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

Future<void> onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (message.data.containsKey('data')) {
    // Handle data message
    // final data = message.data['data'];
  }

  if (message.data.containsKey('notification')) {
    // Handle notification message
    // final notification = message.data['notification'];
  }
  // Or do other work.
}

Future<void> _showNotificationCustomSound(String title, String body) async {
  final Int64List vibrationPattern = Int64List(3);
  vibrationPattern[0] = 100;
  vibrationPattern[1] = 500;
  vibrationPattern[2] = 200;

  final channel = AndroidNotificationDetails(
      'high_importance_channel', // id
      'Stream Notifications', // title
      importance: Importance.max,
      priority: Priority.high,
      enableVibration: true,
      showWhen: false,
      vibrationPattern: vibrationPattern);

  const iOSChannel = IOSNotificationDetails(
      presentAlert: true, presentBadge: true, presentSound: true);

  final platformChannel =
      NotificationDetails(android: channel, iOS: iOSChannel);

  await flutterLocalNotificationsPlugin.show(
    createUniqueId(),
    title,
    body,
    platformChannel,
  );
}

class FCM {
  final _firebaseMessaging = FirebaseMessaging.instance;

  final streamCtlr = StreamController<String>.broadcast();
  final titleCtlr = StreamController<String>.broadcast();
  final bodyCtlr = StreamController<String>.broadcast();

  SharedPreferences? prefs;

  init() async {
    prefs = await SharedPreferences.getInstance();
  }

  _saveToken(String token) async {
    await prefs!.setString('fcm_token', token);
  }

  String? token;

  get getToken {
    return token;
  }

  void initFCMSettings() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notification');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  }

  setNotifications() async {
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(
      (message) async {
        print('message listen');
        if (message.data.containsKey('data')) {
          // Handle data message
          streamCtlr.sink.add(message.data['data']);
        }
        if (message.data.containsKey('notification')) {
          // Handle notification message
          streamCtlr.sink.add(message.data['notification']);
        }
        // Or do other work.
        titleCtlr.sink.add(message.notification!.title!);
        bodyCtlr.sink.add(message.notification!.body!);
        await _showNotificationCustomSound(
            message.notification!.title!, message.notification!.body!);
        // await createNotification(
        //     message.notification!.title!, message.notification!.body!);
      },
    );
    // With this token you can test it easily on your phone
    token = await _firebaseMessaging.getToken().then((value) {
      debugPrint('Token: $value');
      _saveToken(value ?? '');
    });
  }

  // Future<void> createNotification(String title, String body) async {
  //   await AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //       id: createUniqueId(),
  //       channelKey: 'fubo_channel',
  //       title: title,
  //       body: body,
  //       notificationLayout: NotificationLayout.Messaging,
  //       customSound: 'resource://raw/loud_notification',
  //       displayOnBackground: true,
  //       displayOnForeground: true,
  //       locked: true,
  //       wakeUpScreen: true,
  //       fullScreenIntent: true,
  //       criticalAlert: true,
  //     ),
  //   );
  // }

  dispose() {
    streamCtlr.close();
    bodyCtlr.close();
    titleCtlr.close();
  }
}
