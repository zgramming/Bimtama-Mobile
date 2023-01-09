import 'dart:developer';
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../model/datasource/guidance_remote_datasource.dart';
import '../../../model/model/lecture_guidance_detail_outline_model.dart';
import '../../../view_model/guidance/guidance_notifier.dart';

class _ButtonUploadFile extends StatelessWidget {
  const _ButtonUploadFile({
    Key? key,
    required this.onPickFile,
  }) : super(key: key);

  final Function(File file) onPickFile;

  @override
  Widget build(BuildContext context) {
    return FormBody(
      title: "File Pendukung",
      child: Align(
        alignment: Alignment.centerLeft,
        child: OutlinedButton.icon(
          onPressed: () async {
            try {
              final pickedFile = await pickFile();
              onPickFile(pickedFile);
            } catch (e) {
              showSnackbar(context, text: Text("$e"), color: Colors.red);
            } finally {}
          },
          style: outlineButtonStyle(),
          icon: const Icon(Icons.upload),
          label: const Text("Pilih File"),
        ),
      ),
    );
  }
}

class _ButtonDownloadFile extends StatefulWidget {
  const _ButtonDownloadFile({
    Key? key,
    required this.file,
  }) : super(key: key);

  final String? file;

  @override
  State<_ButtonDownloadFile> createState() => _ButtonDownloadFileState();
}

class _ButtonDownloadFileState extends State<_ButtonDownloadFile> {
  bool isLoading = false;
  bool isHaveFile = false;

  @override
  void initState() {
    super.initState();
    isHaveFile = widget.file != null && (widget.file ?? "").isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    if (!isHaveFile) {
      return const Text("-");
    }

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return OutlinedButton.icon(
      onPressed: () async {
        try {
          setState(() => isLoading = true);
          await openFile("$baseFileDirectoryURL/${widget.file}");

          if (!mounted) return;
        } catch (e) {
          log("Error Download File $e");
          showSnackbar(
            context,
            text: Text("$e"),
            color: Colors.red,
          );
        } finally {
          setState(() => isLoading = false);
        }
      },
      icon: const Icon(Icons.download),
      label: const Text("Download"),
    );
  }
}

class GuidanceFormPage extends ConsumerStatefulWidget {
  const GuidanceFormPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  createState() => _GuidanceFormPageState();
}

class _GuidanceFormPageState extends ConsumerState<GuidanceFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _lectureNoteController;
  GuidanceStatus _selectedStatus = GuidanceStatus.progress;
  File? _selectedFile;

  @override
  void initState() {
    super.initState();
    _lectureNoteController = TextEditingController();
  }

  @override
  void dispose() {
    _lectureNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final future = ref.watch(getGuidanceDetail(widget.id));
    ref.listen(getGuidanceDetail(widget.id), (previous, next) {
      next.when(
        data: (response) {
          final data = response.data;

          _lectureNoteController.text = data?.lectureNote ?? "";
          _selectedStatus = data?.status ?? GuidanceStatus.progress;
        },
        error: (error, stackTrace) => log("Error $error"),
        loading: () => log("Loading..."),
      );
    });

    ref.listen(
      lectureGuidanceNotifier.select((value) => value.onUpdate),
      (previous, next) {
        next.when(
          data: (data) {
            showSnackbar(
              context,
              text: Text("${data?.message}"),
              color: Colors.green,
            );

            // TODO: Jika berhasil update ke rejected / approved, disabled button update

            /// Refresh & back to previous page
            ref.invalidate(getGuidanceDetailByCodeOutlineComponent);
            context.pop();
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
    return future.when(
      data: (response) {
        final guidance = response.data;
        final isProgress = (guidance?.status ?? GuidanceStatus.progress) ==
            GuidanceStatus.progress;
        return Scaffold(
          appBar: AppBar(title: Text("Bimbingan ${guidance?.user?.name}")),
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
                          const SizedBox(height: 16.0),
                          FormBody(
                            title: "Judul",
                            child: Text(guidance?.title ?? ""),
                          ),
                          const SizedBox(height: 16.0),
                          FormBody(
                            title: "Deskripsi",
                            child: Text(guidance?.description ?? ""),
                          ),
                          const SizedBox(height: 16.0),
                          FormBody(
                            title: "File Mahasiswa",
                            child: Builder(builder: (context) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    _ButtonDownloadFile(file: guidance?.file),
                              );
                            }),
                          ),
                          const SizedBox(height: 32.0),
                          const Divider(thickness: 2, color: secondary),
                          FormBody(
                            title: "Catatan Dosen",
                            child: TextFormField(
                              controller: _lectureNoteController,
                              minLines: 5,
                              maxLines: 5,
                              decoration: inputDecorationRounded().copyWith(
                                contentPadding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 16.0,
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          FormBody(
                            title: "Status",
                            child: DropdownButtonFormField<GuidanceStatus>(
                              value: _selectedStatus,
                              decoration: inputDecorationRounded(),
                              items: GuidanceStatus.values
                                  .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e.name.toUpperCase())))
                                  .toList(),
                              onChanged: (value) {
                                setState(() => _selectedStatus =
                                    value ?? GuidanceStatus.progress);
                              },
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _ButtonUploadFile(
                                onPickFile: (file) {
                                  setState(() {
                                    _selectedFile = file;
                                  });
                                },
                              ),
                              if (_selectedFile != null) ...[
                                const SizedBox(height: 8.0),
                                Text(basename(_selectedFile?.path ?? "")),
                              ]
                            ],
                          ),
                          const SizedBox(height: 40.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (isProgress)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () async {
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

                      final id = widget.id;
                      final user = ref.read(userNotifier).item;
                      final token = user?.token ?? "";

                      final form = GuidanceFormModel(
                        token: token,
                        id: id,
                        lectureNote: _lectureNoteController.text,
                        status: _selectedStatus,
                        file: _selectedFile,
                      );
                      await ref
                          .read(lectureGuidanceNotifier.notifier)
                          .update(form);
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
        );
      },
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
