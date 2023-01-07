import 'dart:developer';

import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../model/datasource/guidance_remote_datasource.dart';
import '../../../model/model/lecture_guidance_detail_outline_model.dart';
import '../../../view_model/guidance/guidance_notifier.dart';

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
    return future.when(
      data: (response) {
        final guidance = response.data;
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

                    final form = GuidanceFormModel(
                      token: token,
                      id: widget.id,
                      lectureNote: '',
                      status: GuidanceStatus.approved,
                      file: null,
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
