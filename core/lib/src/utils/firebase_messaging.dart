import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

// TODO: When deploy iOS app, please manage permission
// For now we just request permission for Android
final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

Future<NotificationSettings> firebaseMessagingCurrentPermission() async {
  final result = await firebaseMessaging.getNotificationSettings();
  return result;
}

Future<NotificationSettings> firebaseMessagingRequestPermission() async {
  final settings = await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    log('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    log('User granted provisional permission');
  } else {
    log('User declined or has not accepted permission');
  }

  return settings;
}

void firebaseMessagingListen() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log('Got a message whilst in the foreground!');
    log('Message data: ${message.data}');

    if (message.notification != null) {
      log('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    log('A new onMessageOpenedApp event was published!');
  });
}
