import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../view_model/active_group/active_group_notifier.dart';

class EmptyActiveGroup extends StatelessWidget {
  const EmptyActiveGroup({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Card(
            margin: const EdgeInsets.only(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: bodyFont.copyWith(fontSize: 16.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () {
              context.pushNamed(routeDosenGroupForm);
            },
            style: elevatedButtonStyle(),
            icon: const Icon(Icons.add),
            label: const Text("Tambah Kelompok"),
          ),
        ),
      ],
    );
  }
}

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Consumer(
          builder: (context, ref, child) {
            final future = ref.watch(getActiveGroup);

            return future.when(
              data: (response) {
                if (response.message != null) {
                  return EmptyActiveGroup(message: response.message ?? "");
                }
                final group = response.data;

                return const Text("");
              },
              error: (error, stackTrace) => Text("$error"),
              loading: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}

class ScheduleMeetingPage extends StatelessWidget {
  const ScheduleMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [],
          ),
        ),
      ),
    );
  }
}

class GuidancePage extends StatelessWidget {
  const GuidancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [],
          ),
        ),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [],
          ),
        ),
      ),
    );
  }
}

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
