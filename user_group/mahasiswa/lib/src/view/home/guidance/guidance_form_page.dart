// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mahasiswa/mahasiswa.dart';

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

class GuidanceFormPage extends ConsumerStatefulWidget {
  const GuidanceFormPage({
    Key? key,
    required this.codeMasterOutlineComponent,
    required this.title,
  }) : super(key: key);

  final String codeMasterOutlineComponent;
  final String title;

  @override
  createState() => _GuidanceFormPageState();
}

class _GuidanceFormPageState extends ConsumerState<GuidanceFormPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  File? _selectedFile;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      mahasiswaGuidanceNotifier.select((value) => value.onSubmission),
      (previous, next) {
        next.when(
          data: (data) {
            showSnackbar(
              context,
              text: Text("${data?.message}"),
              color: Colors.green,
            );

            /// Refresh & back to previous page
            ref.invalidate(
              getGuidanceDetail(widget.codeMasterOutlineComponent),
            );
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengajuan ${widget.title}"),
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
                      FormBody(
                        title: "Judul",
                        child: TextFormField(
                          controller: _titleController,
                          decoration: inputDecorationRounded()
                              .copyWith(hintText: "Masukkan Judul"),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      FormBody(
                        title: "Keterangan",
                        child: TextFormField(
                          controller: _descriptionController,
                          minLines: 5,
                          maxLines: 5,
                          decoration: inputDecorationRounded().copyWith(
                            hintText: "Masukkan Keterangan",
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 8.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _ButtonUploadFile(
                            onPickFile: (file) => setState(
                              () => _selectedFile = file,
                            ),
                          ),
                          if (_selectedFile != null) ...[
                            const SizedBox(height: 8.0),
                            Text(basename(_selectedFile?.path ?? "")),
                          ]
                        ],
                      ),
                      const SizedBox(height: 16.0),
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

                final user = ref.read(userNotifier).item;
                final token = user?.token ?? "";

                final form = GuidanceSubmissionFormModel(
                  userId: user?.data.id ?? 0,
                  token: token,
                  codeMasterOutlineComponent: widget.codeMasterOutlineComponent,
                  title: _titleController.text,
                  description: _descriptionController.text,
                  file: _selectedFile,
                );

                await ref
                    .read(mahasiswaGuidanceNotifier.notifier)
                    .submission(form);
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
  }
}
