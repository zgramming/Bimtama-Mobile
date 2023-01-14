import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text("testing notifikasi"),
                        subtitle: ElevatedButton(
                          onPressed: () async {
                            try {
                              await customLocalNotification.showNotification(
                                id: 1,
                                title: "Disini title",
                                body: "Disini body",
                                payload: "payload",
                              );
                            } catch (e) {
                              log("$e");
                            }
                          },
                          child: Text("show notification"),
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        leading: const CircleAvatar(
                          child: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(Icons.outlined_flag),
                            ),
                          ),
                        ),
                        title: const Text("Outline"),
                        subtitle: const Text("Pilih Outline Kamu"),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () =>
                            context.pushNamed(routeMahasiswaSettingOutline),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        leading: const CircleAvatar(
                          child: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(Icons.person_pin_rounded),
                            ),
                          ),
                        ),
                        title: const Text("Profile"),
                        subtitle: const Text("Edit profile kamu"),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () =>
                            context.pushNamed(routeMahasiswaSettingProfile),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        leading: const CircleAvatar(
                          child: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(Icons.info_outline_rounded),
                            ),
                          ),
                        ),
                        title: const Text("Tentang Aplikasi"),
                        subtitle: const Text("Tentang Aplikasi"),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () async {
                  ref.read(userNotifier.notifier).unsetUser().then((value) {
                    context.goNamed(routeSplash);
                  });
                },
                style: elevatedButtonStyle(backgroundColor: Colors.red),
                icon: const Icon(Icons.logout),
                label: Text(
                  "LOGOUT",
                  style: bodyFontWhite.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
