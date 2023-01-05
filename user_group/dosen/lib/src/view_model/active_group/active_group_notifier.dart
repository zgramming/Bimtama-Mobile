import 'package:core/core.dart';
import 'package:dosen/src/model/model/lecture_active_group_model.dart';

final getActiveGroup = AutoDisposeFutureProvider(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/dosen/my-group/active/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = LectureActiveGroupModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    return response;
  },
);
