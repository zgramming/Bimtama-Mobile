import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../model/model/group_create_response_model.dart';
import '../../../model/model/group_update_response_model.dart';
import '../../../model/model/lecture_active_group_detail_model.dart';
import '../../../view_model/group/group_notifier.dart';

const _informations = [
  "Saat membuat kelompok, maka kelompok yang baru terbuat otomatis menjadi kelompok aktif kamu.",
  "Jika sebelumnya kamu sudah ada kelompok, maka kelompok sebelumnya menjadi tidak aktif.",
  "Untuk mengubah kelompok aktif kamu, melalui menu Setting > Kelompok.",
];

class _Info extends StatelessWidget {
  const _Info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Informasi",
              style: bodyFontBold.copyWith(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              itemCount: _informations.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final information = _informations[index];
                return ListTile(
                  contentPadding: const EdgeInsets.only(),
                  leading: CircleAvatar(
                    backgroundColor: primary,
                    radius: 15,
                    foregroundColor: Colors.white,
                    child: FittedBox(child: Text("${index + 1}")),
                  ),
                  title: Text(
                    information,
                    style: bodyFont.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GroupFormPage extends ConsumerStatefulWidget {
  const GroupFormPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  createState() => _GroupFormPageState();
}

class _GroupFormPageState extends ConsumerState<GroupFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController codeController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    codeController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final detailGroup = ref.watch(getActiveGroupDetail(widget.id));

    ref.listen<AsyncValue<LectureActiveGroupDetailModel>>(
      getActiveGroupDetail(widget.id),
      (previous, next) {
        next.when(
          data: (response) {
            final data = response.data;
            nameController.text = data?.name ?? "";
            codeController.text = data?.code ?? "";
            descriptionController.text = data?.description ?? "";
          },
          error: (error, stackTrace) => log("Error detail group"),
          loading: () => log("loading detail"),
        );
      },
    );

    ref.listen<AsyncValue<GroupCreateResponseModel?>>(
      lectureGroupNotifier.select((value) => value.onCreate),
      (previous, next) {
        next.when(
          data: (data) {
            showSnackbar(
              context,
              text: Text("${data?.message}"),
              color: Colors.green,
            );

            /// Refresh & clear form
            ref.invalidate(getActiveGroup);
            _formKey.currentState?.reset();
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

    ref.listen<AsyncValue<GroupUpdateResponseModel?>>(
      lectureGroupNotifier.select((value) => value.onUpdate),
      (previous, next) {
        next.when(
          data: (data) {
            showSnackbar(
              context,
              text: Text("${data?.message}"),
              color: Colors.green,
            );

            /// Refresh & clear form
            ref.invalidate(getActiveGroup);
            _formKey.currentState?.reset();
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

    return detailGroup.when(
      data: (row) => Scaffold(
        appBar: AppBar(
          title: Text("Form Kelompok ${row.data?.name ?? ""}"),
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
                        const _Info(),
                        const SizedBox(height: 24.0),
                        FormBody(
                          title: "Nama",
                          child: TextFormField(
                            controller: nameController,
                            decoration: inputDecorationRounded().copyWith(
                              hintText: "Masukkan Nama",
                            ),
                            validator: (value) {
                              if (value == null || value == "") {
                                return "Nama tidak boleh kosong";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              final slug = stringToSlug(value);
                              codeController.text = slug;
                            },
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        FormBody(
                          title: "Kode",
                          child: TextFormField(
                            controller: codeController,
                            readOnly: true,
                            decoration: inputDecorationRounded().copyWith(
                              hintText: "Masukkan Kode",
                              helperText: "Readonly",
                            ),
                            validator: (value) {
                              if (value == null || value == "") {
                                return "Kode tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        FormBody(
                          title: "Deskripsi",
                          child: TextFormField(
                            controller: descriptionController,
                            minLines: 5,
                            maxLines: 5,
                            decoration: inputDecorationRounded().copyWith(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 8.0),
                            ),
                            validator: (value) {
                              if (value == null || value == "") {
                                return "Deskripsi tidak boleh kosong";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 24.0),
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
                  final validate = _formKey.currentState?.validate() ?? false;
                  if (!validate) {
                    showSnackbar(
                      context,
                      text: const Text("Validation Error"),
                      color: Colors.red,
                    );
                    return;
                  }

                  final id = widget.id;
                  final user = ref.read(userNotifier).item;
                  final token = user?.token ?? "";

                  if (id == 0) {
                    /// create
                    await ref.read(lectureGroupNotifier.notifier).create(
                          token,
                          name: nameController.text,
                          code: codeController.text,
                          description: descriptionController.text,
                          createdBy: user?.data.id ?? 0,
                        );
                  } else {
                    /// update
                    await ref.read(lectureGroupNotifier.notifier).update(
                          token,
                          id: id,
                          name: nameController.text,
                          code: codeController.text,
                          description: descriptionController.text,
                          createdBy: user?.data.id ?? 0,
                        );
                  }
                },
                style: elevatedButtonStyle(),
                child: Text(
                  "Simpan",
                  style: bodyFontWhite.copyWith(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
      error: (error, stackTrace) =>
          Scaffold(body: Center(child: Text("$error"))),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
