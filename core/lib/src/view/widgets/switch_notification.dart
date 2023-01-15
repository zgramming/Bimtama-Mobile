import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SwitchNotification extends ConsumerWidget {
  const SwitchNotification({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasNotification =
        ref.watch(applicationSettingNotifier).item.hasNotification;

    return SwitchListTile.adaptive(
      title: const Text("Notifikasi Permission"),
      subtitle: Text(
        hasNotification
            ? "Nonaktifkan notifikasi secara manual"
            : "Aktifkan notifikasi",
      ),
      value: hasNotification,
      onChanged: (value) async {
        /// Check apakah ada permission notifikasi
        /// Jika tidak ada, minta permission
        /// Jika ada, ubah setting notifikasi
        try {
          if (value) {
            await customPermissionHandler.requestPermissionNotification();

            ref.read(applicationSettingNotifier.notifier).changeNotification(
                  value,
                );
          } else {
            /// Revoke permission notification manually
            await openAppSettings();
            return;
          }
        } catch (e) {
          showSnackbar(context, text: Text("$e"), color: Colors.red);
        } finally {}
      },
    );
  }
}
