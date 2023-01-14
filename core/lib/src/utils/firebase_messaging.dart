import 'dart:developer';

import 'package:core/core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CustomFirebaseMessaging {
  CustomFirebaseMessaging._privateConstructor();

  static final CustomFirebaseMessaging instance =
      CustomFirebaseMessaging._privateConstructor();

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

// TODO: When deploy iOS app, please manage permission
// For now we just request permission for Android
  Future<NotificationSettings> getCurrentPermission() async {
    final result = await firebaseMessaging.getNotificationSettings();
    return result;
  }

  Future<NotificationSettings> requestPermission() async {
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
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }

    return settings;
  }

  Future<String?> generateToken() async {
    final result = await firebaseMessaging.getToken();
    return result;
  }

  void listen({
    void Function(RemoteMessage)? onMessage,
    void Function(RemoteMessage)? onmessageOpenedApp,
  }) {
    FirebaseMessaging.onMessage.listen(
      onMessage,
      // (RemoteMessage message) {
      //   log('Got a message whilst in the foreground!');
      //   log('Message data: ${message.data}');

      //   if (message.notification != null) {
      //     log('Message also contained a notification: ${message.notification?.toMap()}');
      //   }

      //   customLocalNotification.showNotification(
      //     id: 2,
      //     title: "title",
      //     body: "body",
      //     payload: "payload",
      //   );
      // },
      onError: (Object e) {
        log('onMessageError: $e');
      },
      onDone: () {
        log('onMessageDone');
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      onmessageOpenedApp,
      // (RemoteMessage message) {
      //   log('A new onMessageOpenedApp event was published!');
      // },
      onError: (Object e) {
        log('onMessageOpenedAppError: $e');
      },
      onDone: () {
        log('onMessageOpenedAppDone');
      },
    );
  }
}

final firebaseMessaging = CustomFirebaseMessaging.instance;
