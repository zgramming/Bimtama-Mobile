import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../view_model/group/group_notifier.dart';

class _SelectedGroup extends Equatable {
  const _SelectedGroup({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;
}

class _DropdownGroups extends ConsumerWidget {
  const _DropdownGroups({
    required this.onChange,
    required this.value,
  });

  final Function(_SelectedGroup? data) onChange;
  final _SelectedGroup? value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(getMyGroupList);

    return future.when(
      data: (response) {
        final groups = response.data ?? [];
        return FormBody(
          title: "Kelompok Saya",
          child: DropdownButtonFormField<_SelectedGroup>(
            value: value,
            hint: Text(
              "Pilih Group",
              style: bodyFont.copyWith(fontSize: 12.0),
            ),
            decoration: inputDecorationRounded(),
            items: groups
                .map((e) => _SelectedGroup(id: e.id, name: e.name))
                .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                .toList(),
            onChanged: onChange,
            validator: (value) {
              if (value == null) {
                return "Kelompok tidak boleh kosong";
              }

              return null;
            },
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text("$error")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class SettingActiveGroupPage extends ConsumerStatefulWidget {
  const SettingActiveGroupPage({super.key});

  @override
  createState() => _SettingActiveGroupPageState();
}

class _SettingActiveGroupPageState
    extends ConsumerState<SettingActiveGroupPage> {
  final _formKey = GlobalKey<FormState>();

  _SelectedGroup? _selectedGroup;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.invalidate(getActiveGroup);
    });
  }

  @override
  Widget build(BuildContext context) {
    final future = ref.watch(getActiveGroup);

    ref.listen(
      lectureGroupNotifier.select((value) => value.onUpdateActiveGroup),
      (previous, next) {
        next.when(
          data: (response) {
            showSnackbar(
              context,
              text: Text("${response?.message}"),
              color: Colors.green,
            );

            /// Restart Application
            context.goNamed(routeSplash);
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

    ref.listen(getActiveGroup, (previous, next) {
      next.whenData((response) {
        final group = response.data;
        if (group != null) {
          setState(() =>
              _selectedGroup = _SelectedGroup(id: group.id, name: group.name));
        }
      });
    });

    return future.unwrapPrevious().when(
          data: (response) => Scaffold(
            appBar: AppBar(
              title: const Text("Edit Kelompok Aktif"),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _DropdownGroups(
                              onChange: (data) =>
                                  setState(() => _selectedGroup = data),
                              value: _selectedGroup,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final validate =
                            _formKey.currentState?.validate() ?? false;
                        if (!validate) {
                          showSnackbar(
                            context,
                            text: const Text("Validation Error"),
                            color: Colors.red,
                          );
                          return;
                        }

                        final user = ref.read(userNotifier).item;
                        final token = user?.token ?? "";

                        await ref
                            .read(lectureGroupNotifier.notifier)
                            .updateActiveGroup(
                              token,
                              userId: user?.data.id ?? 0,
                              groupId: _selectedGroup?.id ?? 0,
                            );
                      } catch (e) {
                        log("error $e");
                      }
                    },
                    style: elevatedButtonStyle(),
                    child: Text(
                      "Simpan",
                      style: bodyFontWhite.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          error: (error, stackTrace) => Scaffold(
            body: Center(child: Text("$error")),
          ),
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
  }
}
