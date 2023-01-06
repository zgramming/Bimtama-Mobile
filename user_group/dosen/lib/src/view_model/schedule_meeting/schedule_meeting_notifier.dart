import 'package:core/core.dart';

import '../../model/model/lecture_schedule_meeting_model.dart';

final getScheduleMeetingByCode =
    AutoDisposeFutureProviderFamily<LectureScheduleMeetingModel, String>(
  (ref, code) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;

    final request = await dio.get(
      "/dosen/meeting-schedule/${user?.data.id}/type/$code",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = LectureScheduleMeetingModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);
