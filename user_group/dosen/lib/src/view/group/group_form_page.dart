import 'package:core/core.dart';
import 'package:flutter/material.dart';

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

class GroupFormPage extends StatefulWidget {
  const GroupFormPage({super.key});

  @override
  State<GroupFormPage> createState() => _GroupFormPageState();
}

class _GroupFormPageState extends State<GroupFormPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController codeController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    nameController = TextEditingController();
    codeController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Kelompok"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                        decoration: inputDecorationRounded().copyWith(),
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
              if (!validate) return;
            },
            style: elevatedButtonStyle(),
            child: Text(
              "Simpan",
              style: bodyFontWhite.copyWith(fontSize: 16.0),
            ),
          ),
        )
      ]),
    );
  }
}
