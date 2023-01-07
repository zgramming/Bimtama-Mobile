// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';
import 'package:dosen/src/model/datasource/guidance_remote_datasource.dart';
import 'package:flutter/material.dart';

import '../../../model/model/lecture_guidance_detail_model.dart';
import '../../../model/model/lecture_guidance_master_outline_model.dart';

class _GuidanceDetailItem extends StatelessWidget {
  const _GuidanceDetailItem({
    Key? key,
    required this.guidance,
    required this.index,
  }) : super(key: key);

  final LectureGuidanceDetailDetailData guidance;
  final int index;
  @override
  Widget build(BuildContext context) {
    final isUserAttachFile =
        guidance.file != null && (guidance.file?.isNotEmpty ?? false);
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      title: Text(
        "${index + 1}. ${guidance.user?.name} - ${guidance.title} ",
        style: bodyFontBold.copyWith(fontSize: 16.0),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("${guidance.description}"),
            const SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isUserAttachFile) ...[
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.file_download),
                        label: const Text("Lihat File"),
                      ),
                    ),
                  ),
                ],
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Card(
                      color: Colors.green,
                      margin: const EdgeInsets.only(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${guidance.status}",
                          style: bodyFontWhite.copyWith(fontSize: 12.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TabBarViewItem extends ConsumerWidget {
  const _TabBarViewItem({
    Key? key,
    required this.outlineComponent,
  }) : super(key: key);

  final LectureGuidanceMasterOutlineData outlineComponent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(
      getGuidanceDetailByCodeOutlineComponent(outlineComponent.code),
    );
    return future.when(
      data: (response) {
        final items = response.data;
        return Stack(
          fit: StackFit.expand,
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom: 40.0,
              ),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = items[index];
                return _GuidanceDetailItem(
                  guidance: item,
                  index: index,
                );
              },
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt_rounded),
                  style:
                      elevatedButtonStyle(radius: BorderRadius.circular(60.0)),
                  label: Text(
                    "Filter ",
                    style: bodyFontWhite.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
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

class GuidancePage extends ConsumerStatefulWidget {
  const GuidancePage({super.key});

  @override
  createState() => _GuidancePageState();
}

class _GuidancePageState extends ConsumerState<GuidancePage>
    with TickerProviderStateMixin {
  late final TabController _controller;

  List<LectureGuidanceMasterOutlineData> outlinesComponent = [];

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final future = ref.watch(getGuidanceMasterOutline);

    ref.listen(getGuidanceMasterOutline, (previous, next) {
      next.whenData(
        (response) {
          outlinesComponent = [...response.data];
          _controller = TabController(
            length: outlinesComponent.length,
            vsync: this,
          );
        },
      );
    });

    return future.when(
      data: (response) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
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
                  tabs: outlinesComponent
                      .map((e) => Tab(
                            text: e.name?.toUpperCase(),
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _controller,
                  children: outlinesComponent
                      .map(
                        (e) => _TabBarViewItem(outlineComponent: e),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text("$error")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
