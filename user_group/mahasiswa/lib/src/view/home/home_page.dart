import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'group/group_page.dart';
import 'guidance/guidance_page.dart';
import 'schedule_meeting/schedule_meeting_page.dart';
import 'setting/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PersistentTabController controller;
  @override
  void initState() {
    super.initState();
    controller = PersistentTabController();

    firebaseMessaging.listen(
      onMessage: (message) {
        // final data = message.data;
        final notification = message.notification;

        if (notification != null) {
          customLocalNotification.showNotification(
            id: 1,
            title: notification.title ?? "",
            body: notification.body ?? "",
            payload: null,
          );
          log("notification: ${notification.toMap()}");
        }
        log('Got a message whilst in the foreground!');
        log("message: ${message.data}");
      },
      onmessageOpenedApp: (message) {
        log('A new onMessageOpenedApp event was published!');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      decoration: const NavBarDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black38,
            offset: Offset.zero,
          ),
        ],
      ),
      screens: const [
        GroupPage(),
        ScheduleMeetingPage(),
        GuidancePage(),
        SettingPage(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.group_rounded),
          title: "Kelompok",
          activeColorSecondary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.calendar_today_rounded),
          title: "Pertemuan",
          activeColorSecondary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.menu_book_rounded),
          title: "Bimbingan",
          activeColorSecondary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings_rounded),
          title: "Setting",
          activeColorSecondary: Colors.white,
        ),
      ],
      navBarStyle: NavBarStyle.style10,
    );
  }
}
