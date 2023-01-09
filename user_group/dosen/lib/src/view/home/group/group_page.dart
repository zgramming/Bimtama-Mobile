import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../view_model/group/group_notifier.dart';

class _EmptyActiveGroup extends StatelessWidget {
  const _EmptyActiveGroup({
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
      ],
    );
  }
}

class _CardActiveGroupInfo extends ConsumerWidget {
  const _CardActiveGroupInfo();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(getActiveGroup);

    return future.when(
      data: (response) {
        if (response.message != null) {
          return _EmptyActiveGroup(
            message: response.message ?? "",
          );
        }
        final group = response.data;

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const Expanded(flex: 4, child: Text("Nama")),
                    Expanded(
                      flex: 8,
                      child: Text("${group?.name}", style: bodyFontBold),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Expanded(flex: 4, child: Text("Kode")),
                    Expanded(
                      flex: 8,
                      child: Text("${group?.code}", style: bodyFontBold),
                    ),
                    InkWell(
                      onTap: () async {
                        Clipboard.setData(
                          ClipboardData(text: group?.code ?? ""),
                        ).then((value) {
                          showSnackbar(
                            context,
                            text: const Text("Kode grup berhasil disalin"),
                            color: primary,
                          );
                        });
                      },
                      child: const Icon(Icons.copy),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.pushNamed(
                        routeDosenGroupForm,
                        params: {'id': "${group?.id}"},
                      );
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit Kelompok"),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => Text("$error"),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _GroupMembers extends ConsumerWidget {
  const _GroupMembers();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(getActiveGroupMember);
    return future.when(
      data: (response) {
        final items = response.data ?? [];
        if (items.isEmpty) {
          return const Center(
            child: Card(
              child: Text("Anggota Kelompok tidak ditemukan"),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Anggota Kelompok",
              style: bodyFont.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  contentPadding: const EdgeInsets.only(),
                  leading: CircleAvatar(
                    radius: 15.0,
                    child: FittedBox(
                      child: Text("${index + 1}"),
                    ),
                  ),
                  title: Text(
                    item.user?.name ?? "",
                    style: bodyFont.copyWith(fontSize: 16.0),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            const Expanded(child: Text("Telepon")),
                            Expanded(
                              child: Text(item.user?.phone ?? "-"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
      error: (error, stackTrace) => Text("$error"),
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class GroupPage extends ConsumerWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(getActiveGroup);
            ref.invalidate(getActiveGroupMember);

            showSnackbar(context, text: const Text("Refresh"), color: primary);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  _CardActiveGroupInfo(),
                  SizedBox(height: 24.0),
                  _GroupMembers(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pushNamed(
            routeDosenGroupForm,
            params: {'id': "0"},
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
