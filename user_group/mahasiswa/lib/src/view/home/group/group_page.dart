import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../model/datasource/group_remote_datasource.dart';
import '../../../model/model/mahasiswa_mygroup_model.dart';
import '../../../model/model/searched_group_model.dart';
import '../../../view_model/group/group_notifier.dart';

class _RowBody extends StatelessWidget {
  const _RowBody({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Text(title)),
        Expanded(
          child: Text(
            content,
            style: bodyFontBold,
          ),
        ),
      ],
    );
  }
}

class _SearchedGroupItem extends ConsumerWidget {
  const _SearchedGroupItem({
    Key? key,
    required this.group,
    required this.members,
  }) : super(key: key);

  final SearchedGroupData group;
  final List<SearchedGroupMember?> members;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      mahasiswaGroupNotifier.select((value) => value.onJoin),
      (previous, next) {
        next.when(
          data: (data) {
            showSnackbar(
              context,
              text: Text("${data?.message}"),
              color: Colors.green,
            );

            /// Refresh & clear form
            ref.invalidate(getMyGroupList);
          },
          error: (error, stackTrace) => showSnackbar(
            context,
            text: Text("$error"),
            color: Colors.red,
          ),
          loading: () => showSnackbar(
            context,
            text: const Text("Loading..."),
            color: secondary,
          ),
        );
      },
    );
    return Card(
      margin: const EdgeInsets.only(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "${group.name}",
              style: headerFontBold.copyWith(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            Text("${group.description}"),
            const SizedBox(height: 16.0),
            Text("Jumlah Anggota : ${members.length}"),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              onPressed: () async {
                final user = ref.read(userNotifier).item;
                final form = GroupJoinFormModel(
                  groupId: group.id ?? 0,
                  token: user?.token ?? "",
                  userId: user?.data.id ?? 0,
                );

                await ref.read(mahasiswaGroupNotifier.notifier).join(form);
              },
              style: elevatedButtonStyle(),
              icon: const Icon(Icons.group_add),
              label: const Text("Masuk Kelompok"),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class _EmptyGroup extends ConsumerStatefulWidget {
  const _EmptyGroup();

  @override
  createState() => _EmptyGroupState();
}

class _EmptyGroupState extends ConsumerState<_EmptyGroup> {
  final searchController = TextEditingController();

  String? searchQuery;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: FormBody(
                title: "Cari Kelompok",
                child: TextFormField(
                  controller: searchController,
                  decoration: inputDecorationRounded().copyWith(
                    hintText: "Cari Berdasarkan Kode",
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {
                setState(() => searchQuery = searchController.text);
              },
              child: const Icon(Icons.search),
            )
          ],
        ),
        if (searchQuery?.isNotEmpty ?? false) ...[
          const SizedBox(height: 24.0),
          Consumer(
            builder: (context, ref, child) {
              final future = ref.watch(getGroupByCode(searchQuery ?? ""));
              return future.when(
                data: (response) {
                  final group = response.data;

                  if (group == null) {
                    return Center(
                      child: Text(
                        response.message,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  final members = group.groupMember ?? [];
                  return _SearchedGroupItem(group: group, members: members);
                },
                error: (error, stackTrace) => Center(child: Text("$error")),
                loading: () => const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ],
    );
  }
}

class GroupPage extends ConsumerWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(getMyGroupList);
          },
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: h(context)),
              padding: const EdgeInsets.all(16.0),
              child: Consumer(
                builder: (context, ref, child) {
                  final future = ref.watch(getMyGroupList);

                  return future.when(
                    data: (response) {
                      final group = response.data;

                      if (group == null) {
                        return const _EmptyGroup();
                      }

                      return _MyGroupItem(group: group);
                    },
                    error: (error, stackTrace) => Center(child: Text("$error")),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MyGroupItem extends ConsumerWidget {
  const _MyGroupItem({
    Key? key,
    required this.group,
  }) : super(key: key);

  final MahasiswaMyGroupData group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final members = group.groupMember ?? [];

    ref.listen(
      mahasiswaGroupNotifier.select((value) => value.onExit),
      (previous, next) {
        next.when(
          data: (data) {
            showSnackbar(
              context,
              text: Text("${data?.message}"),
              color: Colors.green,
            );

            /// Refresh & clear form
            ref.invalidate(getMyGroupList);
          },
          error: (error, stackTrace) => showSnackbar(
            context,
            text: Text("$error"),
            color: Colors.red,
          ),
          loading: () => showSnackbar(
            context,
            text: const Text("Loading..."),
            color: secondary,
          ),
        );
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          margin: const EdgeInsets.only(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _RowBody(
                  title: "Nama Kelompok",
                  content: group.name ?? "",
                ),
                const SizedBox(height: 16.0),
                _RowBody(
                  title: "Kode Kelompok",
                  content: group.code ?? "",
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () async {
                          Clipboard.setData(
                            ClipboardData(text: group.code),
                          ).then(
                            (value) => showSnackbar(
                              context,
                              text: Text("Berhasil copy ${group.code}"),
                              color: primary,
                            ),
                          );
                        },
                        icon: const Icon(Icons.copy),
                        label: const Text("Salin Kode"),
                      ),
                    ),
                    const SizedBox(width: 24.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final user = ref.read(userNotifier).item;

                          final form = GroupExitFormModel(
                            token: user?.token ?? "",
                            userId: user?.data.id ?? 0,
                            groupId: group.id ?? 0,
                          );
                          await ref
                              .read(mahasiswaGroupNotifier.notifier)
                              .exit(form);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const FittedBox(
                          child: Text(
                            "Keluar Kelompok",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40.0),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: members.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final member = members[index];
            return ListTile(
              contentPadding: const EdgeInsets.only(),
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text(
                "${member?.user?.name}",
                style: bodyFontBold.copyWith(fontSize: 16.0),
              ),
              trailing: member?.isAdmin ?? false
                  ? Card(
                      color: Colors.green,
                      margin: const EdgeInsets.only(top: 8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                    )
                  : null,
            );
          },
        ),
      ],
    );
  }
}
