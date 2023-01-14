import 'dart:developer';

import 'package:core/core.dart';

import '../model/schedule_meeting_create_update_response_model.dart';

class ScheduleMeetingFormModel extends Equatable {
  final String token;
  final int userId;
  final String title;
  final String description;
  final String metode;
  final String type;
  final DateTime startDate;
  final DateTime? endDate;
  final String? linkVirtualMeeting;
  final String? linkMaps;

  const ScheduleMeetingFormModel({
    required this.token,
    required this.userId,
    required this.title,
    required this.description,
    required this.metode,
    required this.type,
    required this.startDate,
    this.endDate,
    this.linkVirtualMeeting,
    this.linkMaps,
  });

  @override
  List<Object?> get props {
    return [
      token,
      userId,
      title,
      description,
      metode,
      type,
      startDate,
      endDate,
      linkVirtualMeeting,
      linkMaps,
    ];
  }

  @override
  bool get stringify => true;
}

class ScheduleMeetingRemoteDatasource {
  final Dio dio;
  const ScheduleMeetingRemoteDatasource({
    required this.dio,
  });

  Future<ScheduleMeetingCreateUpdateResponseModel> create(
    ScheduleMeetingFormModel form,
  ) async {
    final formData = FormData.fromMap({
      "user_id": form.userId,
      "title": form.title,
      "description": form.description,
      "method": form.metode,
      "type": form.type,
      "start_date": form.startDate,
      "end_date": form.endDate,
      if (form.linkVirtualMeeting != null)
        "link_meeting": form.linkVirtualMeeting,
      if (form.linkMaps != null) "link_maps": form.linkMaps,
    });

    log("form data: ${form.title}");
    final request = await dio.post(
      "/dosen/meeting-schedule",
      data: formData,
      options: Options(
        headers: {"Authorization": "Bearer ${form.token}"},
      ),
    );

    final response = ScheduleMeetingCreateUpdateResponseModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }
      throw Exception(response.message);
    }

    return response;
  }

  Future<ScheduleMeetingCreateUpdateResponseModel> createPersonal(
    int studentId, {
    required ScheduleMeetingFormModel form,
  }) async {
    final formData = FormData.fromMap({
      "user_id": form.userId,
      "student_id": studentId,
      "title": form.title,
      "description": form.description,
      "method": form.metode,
      "type": form.type,
      "start_date": form.startDate,
      "end_date": form.endDate,
      if (form.linkVirtualMeeting != null)
        "link_meeting": form.linkVirtualMeeting,
      if (form.linkMaps != null) "link_maps": form.linkMaps,
    });

    final request = await dio.post(
      "/dosen/meeting-schedule/personal",
      data: formData,
      options: Options(
        headers: {"Authorization": "Bearer ${form.token}"},
      ),
    );

    final response = ScheduleMeetingCreateUpdateResponseModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }
      throw Exception(response.message);
    }

    return response;
  }

  Future<ScheduleMeetingCreateUpdateResponseModel> update(
    int id, {
    required ScheduleMeetingFormModel form,
  }) async {
    final formData = FormData.fromMap({
      "user_id": form.userId,
      "title": form.title,
      "description": form.description,
      "method": form.metode,
      "type": form.type,
      "start_date": form.startDate,
      "end_date": form.endDate,
      if (form.linkVirtualMeeting != null)
        "link_meeting": form.linkVirtualMeeting,
      if (form.linkMaps != null) "link_maps": form.linkMaps,
    });

    final request = await dio.put(
      "/dosen/meeting-schedule/$id",
      data: formData,
      options: Options(
        headers: {"Authorization": "Bearer ${form.token}"},
      ),
    );

    final response = ScheduleMeetingCreateUpdateResponseModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }
      throw Exception(response.message);
    }

    return response;
  }

  Future<ScheduleMeetingCreateUpdateResponseModel> updatePersonal(
    int id,
    int studentId, {
    required ScheduleMeetingFormModel form,
  }) async {
    final formData = FormData.fromMap({
      "user_id": form.userId,
      "student_id": studentId,
      "title": form.title,
      "description": form.description,
      "method": form.metode,
      "type": form.type,
      "start_date": form.startDate,
      "end_date": form.endDate,
      if (form.linkVirtualMeeting != null)
        "link_meeting": form.linkVirtualMeeting,
      if (form.linkMaps != null) "link_maps": form.linkMaps,
    });

    final request = await dio.put(
      "/dosen/meeting-schedule/$id",
      data: formData,
      options: Options(
        headers: {"Authorization": "Bearer ${form.token}"},
      ),
    );

    final response = ScheduleMeetingCreateUpdateResponseModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }
      throw Exception(response.message);
    }

    return response;
  }
}
