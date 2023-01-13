import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mahasiswa/src/model/model/mahasiswa_guidance_outline_model.dart';

import '../../../model/model/mahasiswa_guidance_detail_model.dart';
import '../../../view_model/guidance/guidance_notifier.dart';

class _ButtonNoteDosen extends StatelessWidget {
  const _ButtonNoteDosen({
    Key? key,
    required this.note,
  }) : super(key: key);

  final String? note;

  @override
  Widget build(BuildContext context) {
    if (note == null) return const SizedBox();
    return ElevatedButton.icon(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Catatan Dosen"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$note",
                  style: bodyFont.copyWith(fontSize: 14.0),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(Icons.visibility, size: 12.0),
      label: Text(
        "Catatan Dosen",
        style: bodyFontBold.copyWith(fontSize: 10.0),
      ),
    );
  }
}

class _ButtonFileDosen extends StatefulWidget {
  const _ButtonFileDosen({
    Key? key,
    required this.file,
  }) : super(key: key);
  final String? file;

  @override
  State<_ButtonFileDosen> createState() => _ButtonFileDosenState();
}

class _ButtonFileDosenState extends State<_ButtonFileDosen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    if (widget.file == null) return const SizedBox();

    return OutlinedButton.icon(
      onPressed: () async {
        try {
          setState(() => isLoading = true);
          await openFile("$baseFileDirectoryURL/${widget.file}");

          if (!mounted) return;
        } catch (e) {
          showSnackbar(
            context,
            text: Text("$e"),
            color: Colors.red,
          );
        } finally {
          setState(() => isLoading = false);
        }
      },
      icon: const Icon(Icons.download, size: 12.0),
      label: Text(
        "File Dosen",
        style: bodyFontBold.copyWith(fontSize: 10.0),
      ),
    );
  }
}

class _ButtonMyFile extends StatefulWidget {
  const _ButtonMyFile({
    Key? key,
    required this.file,
  }) : super(key: key);

  final String? file;

  @override
  State<_ButtonMyFile> createState() => _ButtonMyFileState();
}

class _ButtonMyFileState extends State<_ButtonMyFile> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (widget.file == null) return const SizedBox();

    return OutlinedButton.icon(
      onPressed: () async {
        try {
          setState(() => isLoading = true);
          await openFile("$baseFileDirectoryURL/${widget.file}");

          if (!mounted) return;
        } catch (e) {
          showSnackbar(
            context,
            text: Text("$e"),
            color: Colors.red,
          );
        } finally {
          setState(() => isLoading = false);
        }
      },
      icon: const Icon(Icons.download, size: 12.0),
      label: Text(
        "File Saya",
        style: bodyFontBold.copyWith(fontSize: 10.0),
      ),
    );
  }
}

class _EmptyGuidance extends ConsumerWidget {
  const _EmptyGuidance();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      mahasiswaGuidanceNotifier.select((value) => value.onStart),
      (previous, next) {
        next.when(
          data: (data) {
            showSnackbar(
              context,
              text: Text("${data?.message}"),
              color: Colors.green,
            );

            /// Refresh
            ref.invalidate(getGuidance);
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          margin: const EdgeInsets.only(),
          color: secondary,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            title: Text(
              "Warning",
              style: headerFontBold.copyWith(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Setelah kamu memulai bimbingan, kamu tidak diperbolehkan untuk mengubah outline. Pastikan kamu sudah memilih outline yang benar sebelum memulai bimbingan.",
                style: bodyFontWhite.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton.icon(
          onPressed: () async {
            final user = ref.read(userNotifier).item;
            final token = user?.token ?? "";

            await ref.read(mahasiswaGuidanceNotifier.notifier).start(
                  token,
                  userId: user?.data.id ?? 0,
                );
          },
          style: elevatedButtonStyle(),
          icon: const Icon(Icons.star),
          label: Text(
            "Mulai Bimbingan",
            style: bodyFontWhite.copyWith(fontSize: 16.0),
          ),
        )
      ],
    );
  }
}

class _GuidanceTab extends ConsumerWidget {
  const _GuidanceTab({
    Key? key,
    required TabController controller,
    required this.outlineComponent,
  })  : _controller = controller,
        super(key: key);

  final TabController _controller;
  final List<OutlineComponent?> outlineComponent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(getGuidanceProgress);
    return future.when(
      data: (response) {
        return Container(
          padding: EdgeInsets.only(top: statusBarHeight(context)),
          color: primary,
          child: TabBar(
            isScrollable: true,
            controller: _controller,
            indicator: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: secondary,
                  width: 3,
                ),
              ),
            ),
            tabs: outlineComponent
                .map((e) => Tab(text: e?.title?.toUpperCase()))
                .toList(),
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text("$error")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _GuidanceTabBarViewItem extends StatelessWidget {
  const _GuidanceTabBarViewItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final MahasiswaGuidanceDetailData? item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final createdAt = item?.createdAt;
    final format = DateFormat('dd MMMM yyyy HH:mm');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(),
          title: Text("${index + 1}. ${item?.title}"),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(item?.description ?? ""),
                if (createdAt != null) ...[
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 12.0,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        format.format(createdAt),
                        style: bodyFontBold.copyWith(fontSize: 12.0),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 8.0),
              ],
            ),
          ),
          trailing: Builder(
            builder: (context) {
              final isApproved = item?.status == GuidanceStatus.approved;
              final isRejected = item?.status == GuidanceStatus.rejected;

              return Card(
                margin: const EdgeInsets.only(),
                color: isApproved
                    ? Colors.green
                    : isRejected
                        ? Colors.red
                        : primary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${item?.status.name.toUpperCase()}",
                    style: bodyFontBold.copyWith(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16.0),
        Wrap(
          spacing: 10,
          children: [
            _ButtonFileDosen(file: item?.fileLecture),
            _ButtonNoteDosen(note: item?.lectureNote),
            _ButtonMyFile(file: item?.file),
          ],
        ),
      ],
    );
  }
}

class _GuidanceTabBarView extends ConsumerWidget {
  const _GuidanceTabBarView(
    this.masterOutlineComponentCode,
  );

  final String masterOutlineComponentCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuIsAccessible =
        ref.watch(guidanceMenuIsAccessible(masterOutlineComponentCode));

    if (!menuIsAccessible) {
      return const Center(
          child: Text("Kamu belum mempunyai akses ke menu ini"));
    }
    final future = ref.watch(getGuidanceDetail(masterOutlineComponentCode));
    return future.when(
      data: (response) {
        final items = response.data ?? [];
        return Stack(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: items.length,
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom: 100.0,
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = items[index];

                return _GuidanceTabBarViewItem(
                  item: item,
                  index: index,
                );
              },
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: FloatingActionButton.extended(
                label: Text("Pengajuan"),
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            )
          ],
        );
      },
      error: (error, stackTrace) => Center(child: Text("$error")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _GuidanceOutline extends ConsumerStatefulWidget {
  const _GuidanceOutline();

  @override
  createState() => __GuidanceOutlineState();
}

class __GuidanceOutlineState extends ConsumerState<_GuidanceOutline>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  Widget build(BuildContext context) {
    final future = ref.watch(initializeGuidanceOutline);

    ref.listen(
      initializeGuidanceOutline,
      (previous, next) {
        next.whenData((response) {
          final outlineComponent =
              response.outline.data?.outline?.outlineComponent ?? [];
          _controller = TabController(
            length: outlineComponent.length,
            vsync: this,
          );
        });
      },
    );

    return future.when(
      data: (response) {
        final outline = response.outline.data?.outline;
        final outlineComponent = outline?.outlineComponent ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _GuidanceTab(
              controller: _controller,
              outlineComponent: outlineComponent,
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: outlineComponent
                    .map(
                      (e) => _GuidanceTabBarView(
                        e?.masterOutlineComponent?.code ?? "",
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Center(child: Text("$error")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class GuidancePage extends StatelessWidget {
  const GuidancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final future = ref.watch(getGuidance);

          return future.when(
            data: (response) {
              final guidance = response.data;

              if (guidance == null) {
                return const _EmptyGuidance();
              }

              return const _GuidanceOutline();
            },
            error: (error, stackTrace) => Center(child: Text("$error")),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
