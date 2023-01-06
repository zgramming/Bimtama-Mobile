import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Card(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: ListTile.divideTiles(
                    context: context,
                    tiles: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        leading: const CircleAvatar(
                          child: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Icon(Icons.group),
                            ),
                          ),
                        ),
                        title: const Text("Kelompok Aktif"),
                        subtitle: const Text("Edit kelompok aktif kamu"),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () =>
                            context.pushNamed(routeDosenSettingActiveGroup),
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
                            context.pushNamed(routeDosenSettingProfile),
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
                  ).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () => '',
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
    );
  }
}
