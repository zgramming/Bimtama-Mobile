import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

// TODO: Readme
/// Initialize Firebase Messaging : https://firebase.flutter.dev/docs/messaging/overview

// factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) =>
//     _$AuthenticationResponseModelFromJson(json);
// Map<String, dynamic> toJson() => _$AuthenticationResponseModelToJson(this);

/// flutter pub run build_runner watch --delete-conflicting-outputs

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  log('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    log(
      'notification action tapped with input: ${notificationResponse.input}',
    );
  }
}

Future<void> setupFlutterNotifications() async {
  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  log('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  customLocalNotification.initialize(
    onDidReceiveNotificationResponse: (notification) {
      log("ondidiReceiveNotificationResponse: ${notification.payload}");
    },
    onDidReceiveLocalNotification: (id, title, body, payload) {
      log("message: $id, $title, $body, $payload");
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  /// Every time the app is opened, the token is refreshed.
  /// https://github.com/firebase/flutterfire/issues/6011
  await FirebaseMessaging.instance.getToken();

  runApp(const ProviderScope(child: MyApp()));
}
