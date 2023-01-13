import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../view_model/profile/profile_notifier.dart';

class SettingProfilePage extends ConsumerStatefulWidget {
  const SettingProfilePage({super.key});

  @override
  createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends ConsumerState<SettingProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final future = ref.watch(getProfile);

    ref.listen(
      lectureProfileNotifier.select((value) => value.onUpdate),
      (previous, next) {
        next.when(
          data: (response) {
            /// Replace Session & Restart Application
            if (response != null) {
              showSnackbar(
                context,
                text: const Text("Berhasil update profile"),
                color: Colors.green,
              );
              ref.read(userNotifier.notifier).setUser(response);
              context.goNamed(routeSplash);
            }
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
            duration: const Duration(days: 365),
          ),
        );
      },
    );

    ref.listen(
      getProfile,
      (previous, next) {
        next.whenData((response) {
          final profile = response.data;
          nameController.text = profile?.name ?? "";
          phoneController.text = profile?.phone ?? "";
        });
      },
    );

    return future.when(
      data: (response) {
        final profile = response.data;
        return Scaffold(
          appBar: AppBar(title: Text("Edit Profile ${profile?.name}")),
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
                            title: "Nama",
                            child: TextFormField(
                              controller: nameController,
                              decoration: inputDecorationRounded(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Nama tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          FormBody(
                            title: "Telepon",
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: inputDecorationRounded(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Telepon tidak boleh kosong";
                                }
                                return null;
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

                      await ref.read(lectureProfileNotifier.notifier).update(
                            token,
                            userId: user?.data.id ?? 0,
                            name: nameController.text,
                            phone: phoneController.text,
                          );
                    } catch (e) {
                      showSnackbar(
                        context,
                        text: Text("$e"),
                        color: Colors.red,
                      );
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
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text("$error")),
      ),
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
