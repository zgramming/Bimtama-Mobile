import 'dart:developer';

import 'package:core/core.dart';
import 'package:dosen/src/model/model.dart';
import 'package:dosen/src/view_model/view_model.dart';
import 'package:flutter/material.dart';

import '../../../model/model/lecture_schedule_meeting_detail_model.dart';
import '../../../model/model/schedule_meeting_create_update_response_model.dart';

enum _MeetingMethod { luring, daring }

class _DropdownMembersModel extends Equatable {
  final int studentId;
  final String name;
  const _DropdownMembersModel({
    required this.studentId,
    required this.name,
  });

  @override
  List<Object> get props => [studentId, name];

  @override
  bool get stringify => true;
}

class _DropdownMembers extends StatelessWidget {
  const _DropdownMembers({
    Key? key,
    required this.selectedMember,
    required this.onChange,
  }) : super(key: key);

  final _DropdownMembersModel? selectedMember;
  final Function(_DropdownMembersModel? member) onChange;

  @override
  Widget build(BuildContext context) {
    return FormBody(
      title: "Anggota Kelompok",
      child: Consumer(builder: (context, ref, child) {
        final future = ref.watch(getActiveGroupMember);
        return future.when(
          data: (response) {
            final members = response.data ?? [];
            return DropdownButtonFormField<_DropdownMembersModel>(
              value: selectedMember,
              hint: Text(
                "Pilih Anggota",
                style: bodyFont.copyWith(fontSize: 12.0),
              ),
              items: members
                  .map((e) => _DropdownMembersModel(
                      studentId: e.userId, name: e.user?.name ?? ""))
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              decoration: inputDecorationRounded(),
              validator: (value) {
                if (value == null) {
                  return "Anggota kelompok tidak boleh kosong";
                }
                return null;
              },
              onChanged: (value) => onChange(value),
            );
          },
          error: (error, stackTrace) => Text("$error"),
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      }),
    );
  }
}

class ScheduleMeetingGroupFormPage extends ConsumerStatefulWidget {
  const ScheduleMeetingGroupFormPage({
    Key? key,
    required this.id,
    required this.type,
  }) : super(key: key);

  final int id;
  final String type;

  @override
  createState() => _ScheduleMeetingGroupFormPageState();
}

class _ScheduleMeetingGroupFormPageState
    extends ConsumerState<ScheduleMeetingGroupFormPage> {
  final _formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat('yyyy-MM-dd HH:mm', 'id-ID');

  late final bool isTypeGroup;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController linkMapsController;
  late final TextEditingController linkVirtualMeetingController;
  late final TextEditingController startDateController;
  late final TextEditingController endDateController;

  _MeetingMethod selectedMethod = _MeetingMethod.luring;
  _DropdownMembersModel? selectedMember;
  @override
  void initState() {
    super.initState();
    isTypeGroup = widget.type == "group";

    titleController = TextEditingController();
    descriptionController = TextEditingController();
    linkMapsController = TextEditingController();
    linkVirtualMeetingController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    titleController.dispose();
    descriptionController.dispose();
    linkMapsController.dispose();
    linkVirtualMeetingController.dispose();
    startDateController.dispose();
    endDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<ScheduleMeetingCreateUpdateResponseModel?>>(
      lectureScheduleMeetingNotifier.select((value) => value.onCreate),
      (previous, next) {
        next.when(
          data: (data) {
            /// Reset For & Reload Future Provider
            _formKey.currentState?.reset();
            ref.invalidate(getScheduleMeetingByType("personal"));
            ref.invalidate(getScheduleMeetingByType("group"));
            showSnackbar(
              context,
              text: Text("${data?.message}"),
              color: Colors.green,
            );
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

    ref.listen<AsyncValue<ScheduleMeetingCreateUpdateResponseModel?>>(
      lectureScheduleMeetingNotifier.select((value) => value.onUpdate),
      (previous, next) {
        next.when(
          data: (data) {
            /// Reload Future Provider
            ref.invalidate(getScheduleMeetingByType("personal"));
            ref.invalidate(getScheduleMeetingByType("group"));
            showSnackbar(
              context,
              text: Text("${data?.message}"),
              color: Colors.green,
            );
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

    ref.listen<AsyncValue<LectureScheduleMeetingDetailModel?>>(
      getScheduleMeetingById(widget.id),
      (previous, next) {
        next.when(
          data: (response) {
            setState(() {
              final meeting = response?.data;
              final meetingPersonal = meeting?.meetingSchedulePersonal;
              final isDaring = meeting?.method == "daring";

              titleController.text = meeting?.title ?? "";
              descriptionController.text = meeting?.description ?? "";
              linkMapsController.text = meeting?.linkMaps ?? "";
              linkVirtualMeetingController.text = meeting?.linkMeeting ?? "";
              selectedMethod =
                  isDaring ? _MeetingMethod.daring : _MeetingMethod.luring;
              startDateController.text = meeting?.startDate == null
                  ? ""
                  : dateFormat.format(meeting!.startDate);
              endDateController.text = meeting?.endDate == null
                  ? ""
                  : dateFormat.format(meeting!.endDate!);

              selectedMember = meetingPersonal == null
                  ? null
                  : _DropdownMembersModel(
                      studentId: meetingPersonal.userId,
                      name: meetingPersonal.user?.name ?? "",
                    );
            });
          },
          error: (error, stackTrace) => log("Error Detail $error"),
          loading: () => log("Loading detail..."),
        );
      },
    );

    final meetingDetailFuture = ref.watch(getScheduleMeetingById(widget.id));

    return meetingDetailFuture.when(
      data: (response) {
        final meeting = response.data;
        return Scaffold(
          appBar: AppBar(
            title: Text("Form ${widget.type.toUpperCase()}"),
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
                          /// Is Personal Type
                          if (!isTypeGroup) ...[
                            _DropdownMembers(
                              selectedMember: selectedMember,
                              onChange: (member) => setState(
                                () => selectedMember = member,
                              ),
                            ),
                            const SizedBox(height: 24.0),
                          ],
                          FormBody(
                            title: "Judul",
                            child: TextFormField(
                              controller: titleController,
                              decoration: inputDecorationRounded().copyWith(
                                hintText: "Masukkan Judul",
                              ),
                              validator: (value) {
                                if (value == null || value == "") {
                                  return "Judul tidak boleh kosong";
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
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              minLines: 5,
                              maxLines: 5,
                              decoration: inputDecorationRounded().copyWith(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 8.0,
                                ),
                                hintText: "Masukkan Deskripsi",
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
                          FormBody(
                            title: "Metode",
                            child: Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    contentPadding: const EdgeInsets.only(),
                                    value: _MeetingMethod.daring,
                                    groupValue: selectedMethod,
                                    title: Text(
                                      _MeetingMethod.daring.name.toUpperCase(),
                                    ),
                                    onChanged: (value) => setState(
                                      () => selectedMethod =
                                          value ?? _MeetingMethod.daring,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    contentPadding: const EdgeInsets.only(),
                                    value: _MeetingMethod.luring,
                                    title: Text(
                                      _MeetingMethod.luring.name.toUpperCase(),
                                    ),
                                    groupValue: selectedMethod,
                                    onChanged: (value) => setState(
                                      () => selectedMethod =
                                          value ?? _MeetingMethod.daring,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            children: [
                              Expanded(
                                child: FormBody(
                                  title: "Mulai",
                                  child: TextFormField(
                                    controller: startDateController,
                                    readOnly: true,
                                    style: bodyFont.copyWith(fontSize: 14.0),
                                    decoration:
                                        inputDecorationRounded().copyWith(
                                      hintText: "Masukkan Tanggal Mulai",
                                      helperText: "Readonly",
                                    ),
                                    validator: (value) {
                                      if (value == null || value == "") {
                                        return "Tanggal Mulai tidak boleh kosong";
                                      }
                                      return null;
                                    },
                                    onTap: () async {
                                      final datetime =
                                          await showDateTimePicker(context);
                                      if (datetime != null) {
                                        setState(() {
                                          startDateController.text =
                                              dateFormat.format(datetime);
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 24.0),
                              Expanded(
                                child: FormBody(
                                  title: "Selesai",
                                  child: TextFormField(
                                    controller: endDateController,
                                    style: bodyFont.copyWith(fontSize: 14.0),
                                    readOnly: true,
                                    decoration:
                                        inputDecorationRounded().copyWith(
                                      hintText: "Masukkan Tanggal Selesai",
                                      helperText: "Readonly",
                                    ),
                                    onTap: () async {
                                      final datetime =
                                          await showDateTimePicker(context);
                                      if (datetime != null) {
                                        setState(() {
                                          endDateController.text =
                                              dateFormat.format(datetime);
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          if (selectedMethod == _MeetingMethod.luring) ...[
                            FormBody(
                              title: "Link Maps",
                              child: TextFormField(
                                controller: linkMapsController,
                                decoration: inputDecorationRounded().copyWith(
                                  hintText: "Masukkan Link Maps",
                                ),
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Link Map tidak boleh kosong";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                          if (selectedMethod == _MeetingMethod.daring) ...[
                            FormBody(
                              title: "Link Virtual Meeting",
                              child: TextFormField(
                                controller: linkVirtualMeetingController,
                                decoration: inputDecorationRounded().copyWith(
                                  hintText: "Masukkan Link Virtual Meeting",
                                ),
                                validator: (value) {
                                  if (value == null || value == "") {
                                    return "Link Virtual Meeting tidak boleh kosong";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
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

                    final form = ScheduleMeetingFormModel(
                      token: token,
                      userId: user?.data.id ?? 0,
                      title: titleController.text,
                      description: descriptionController.text,
                      metode: selectedMethod.name,
                      type: widget.type,
                      startDate: DateTime.parse(startDateController.text),
                      endDate: DateTime.tryParse(endDateController.text),
                      linkMaps: linkMapsController.text,
                      linkVirtualMeeting: linkVirtualMeetingController.text,
                    );

                    if (meeting?.id == null) {
                      /// create
                      if (isTypeGroup) {
                        await ref
                            .read(lectureScheduleMeetingNotifier.notifier)
                            .create(form);
                      } else {
                        await ref
                            .read(lectureScheduleMeetingNotifier.notifier)
                            .createPersonal(
                              selectedMember?.studentId ?? 0,
                              form: form,
                            );
                      }
                    } else {
                      /// update
                      if (isTypeGroup) {
                        await ref
                            .read(lectureScheduleMeetingNotifier.notifier)
                            .update(
                              id,
                              form: form,
                            );
                      } else {
                        await ref
                            .read(lectureScheduleMeetingNotifier.notifier)
                            .updatePersonal(
                              id,
                              selectedMember?.studentId ?? 0,
                              form: form,
                            );
                      }
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
        );
      },
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text("$error")),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
