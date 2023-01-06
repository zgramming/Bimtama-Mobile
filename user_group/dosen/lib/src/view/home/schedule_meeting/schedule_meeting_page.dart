import 'package:core/core.dart';
import 'package:dosen/dosen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../model/model/lecture_schedule_meeting_model.dart';

class _TypeScheduleMeeting {
  final String type;
  final String name;
  _TypeScheduleMeeting({
    required this.type,
    required this.name,
  });
}

final _typeScheduleMeeting = <_TypeScheduleMeeting>[
  _TypeScheduleMeeting(type: "group", name: "Kelompok"),
  _TypeScheduleMeeting(type: "personal", name: "Personal"),
];

class _Date extends StatelessWidget {
  const _Date({
    Key? key,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  final String startDate;
  final String? endDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Text("Mulai"),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Card(
                  color: primary,
                  margin: const EdgeInsets.only(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      startDate,
                      style: bodyFontWhite.copyWith(
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        if (endDate != null) ...[
          const SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Text("Selesai"),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Card(
                    color: primary,
                    margin: const EdgeInsets.only(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "$endDate",
                        style: bodyFontWhite.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ],
    );
  }
}

class _Link extends StatelessWidget {
  const _Link({
    Key? key,
    required this.method,
    required this.linkMeeting,
    required this.linkMaps,
  }) : super(key: key);

  final String method;
  final String? linkMeeting;
  final String? linkMaps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Text("Link")),
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: () async {
              final link = method == "daring" ? linkMeeting : linkMaps;
              final uriLink = Uri.parse(link ?? "");
              try {
                // final launch = await launchUrl(Uri.parse(link ?? ""));
                if (await canLaunchUrl(uriLink)) {
                  await launchUrl(
                    uriLink,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  throw Exception("Tidak dapat membuka $link");
                }
              } catch (e) {
                showSnackbar(
                  context,
                  text: Text(e.toString()),
                  color: Colors.red,
                );
              }
            },
            onLongPress: () async {
              final link = method == "daring" ? linkMeeting : linkMaps;
              Clipboard.setData(ClipboardData(text: link)).then((value) {
                showSnackbar(
                  context,
                  text: Text("Berhasil menyalin $link"),
                  color: Colors.green,
                );
              });
            },
            child: Text(
              "${method == "daring" ? linkMeeting : linkMaps}",
              style: bodyFontBold.copyWith(
                color: primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScheduleMeetingItem extends StatelessWidget {
  const _ScheduleMeetingItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  final LectureScheduleMeetingData item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd MMMM yyyy HH:mm", 'id-ID');
    final startDate = dateFormat.format(item.startDate);
    final endDate =
        item.endDate != null ? dateFormat.format(item.endDate!) : null;
    return ListTile(
      contentPadding: const EdgeInsets.only(),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              "${index + 1}. ${item.title}",
              style: bodyFontBold.copyWith(fontSize: 16.0),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(),
            color: Colors.green.shade400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.method.toUpperCase(),
                style: bodyFontWhite.copyWith(fontSize: 10.0),
              ),
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.description ?? "",
              style: bodyFont.copyWith(
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(height: 16.0),
            _Date(startDate: startDate, endDate: endDate),
            const SizedBox(height: 16.0),
            _Link(
              linkMaps: item.linkMaps,
              linkMeeting: item.linkMeeting,
              method: item.method,
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.pushNamed(
                    routeDosenScheduleMeetingForm,
                    params: {
                      "id": "${item.id}",
                      "type": item.type,
                    },
                  );
                },
                style: elevatedButtonStyle(padding: const EdgeInsets.all(12.0)),
                icon: const Icon(Icons.edit_rounded, size: 14.0),
                label: Text(
                  "Edit",
                  style: bodyFontWhite.copyWith(fontSize: 14.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class TabBarViewItem extends ConsumerWidget {
  const TabBarViewItem({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(getScheduleMeetingByType(type));
    return future.when(
      data: (response) {
        final items = response.data;
        if (items.isEmpty) {
          return const Center(child: Text("Tidak ada jadwal pertemuan"));
        }

        return Stack(
          fit: StackFit.expand,
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
                bottom: 60.0,
              ),
              itemCount: items.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final item = items[index];

                return _ScheduleMeetingItem(
                  item: item,
                  index: index,
                );
              },
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: InkWell(
                onTap: () async {
                  context.pushNamed(
                    routeDosenScheduleMeetingForm,
                    params: {
                      "id": "0",
                      "type": type,
                    },
                  );
                },
                child: const CircleAvatar(
                  backgroundColor: secondary,
                  foregroundColor: Colors.white,
                  radius: 30,
                  child: Icon(Icons.add, size: 30.0),
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

class ScheduleMeetingPage extends StatefulWidget {
  const ScheduleMeetingPage({super.key});

  @override
  State<ScheduleMeetingPage> createState() => _ScheduleMeetingPageState();
}

class _ScheduleMeetingPageState extends State<ScheduleMeetingPage>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id-ID');
    _controller = TabController(
      length: _typeScheduleMeeting.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(top: statusBarHeight(context)),
            color: primary,
            child: TabBar(
              controller: _controller,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: secondary,
                    width: 3,
                  ),
                ),
              ),
              tabs: _typeScheduleMeeting
                  .map((e) => Tab(text: e.name.toUpperCase()))
                  .toList(),
              onTap: (value) => '',
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: _typeScheduleMeeting
                  .map(
                    (e) => TabBarViewItem(type: e.type),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
