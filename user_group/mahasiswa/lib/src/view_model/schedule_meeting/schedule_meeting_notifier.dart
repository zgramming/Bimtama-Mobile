import 'package:core/core.dart';

import '../../model/model/mahasiswa_schedule_meeting_model.dart';

final getScheduleMeetingByType =
    AutoDisposeFutureProviderFamily<MahasiswaScheduleMeetingModel, String>(
  (ref, type) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;

    final request = await dio.get(
      "/mahasiswa/meeting-schedule/${user?.data.id}/type/$type",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = MahasiswaScheduleMeetingModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);
