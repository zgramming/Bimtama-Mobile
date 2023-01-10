// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../view_model/outline/outline_notifier.dart';

class _SelectedOutlineModel extends Equatable {
  const _SelectedOutlineModel({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}

class _DropdownOutline extends ConsumerWidget {
  const _DropdownOutline({
    this.value,
    required this.onChange,
  });
  final _SelectedOutlineModel? value;
  final void Function(_SelectedOutlineModel? val) onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(getAdminOutline);
    return future.when(
      data: (response) {
        final items = response.data ?? [];
        final mapping = items.map(
          (e) => _SelectedOutlineModel(id: e?.id ?? 0, title: e?.title ?? ""),
        );
        return FormBody(
          title: "Outline",
          child: DropdownButtonFormField<_SelectedOutlineModel>(
            value: value,
            isExpanded: true,
            decoration: inputDecorationRounded(),
            selectedItemBuilder: (context) => mapping
                .map((e) => Text(
                      e.title,
                      overflow: TextOverflow.fade,
                    ))
                .toList(),
            items: mapping
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            onChanged: onChange,
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text("$error")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class OutlinePage extends ConsumerStatefulWidget {
  const OutlinePage({super.key});

  @override
  createState() => _OutlinePageState();
}

class _OutlinePageState extends ConsumerState<OutlinePage> {
  final _formKey = GlobalKey<FormState>();
  _SelectedOutlineModel? _selectedOutline;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final future = ref.watch(getMahasiswaOutline);
    ref.listen(getMahasiswaOutline, (previous, next) {
      next.whenData((response) {
        final outline = response.data?.outline;
        _selectedOutline = _SelectedOutlineModel(
          id: outline?.id ?? 0,
          title: outline?.title ?? "",
        );
      });
    });

    return future.when(
      data: (response) {
        final outline = response.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("Form Outline ${outline?.user?.name}"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _DropdownOutline(
                          value: _selectedOutline,
                          onChange: (val) => setState(
                            () => _selectedOutline = val,
                          ),
                        ),
                      ],
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
              )
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
