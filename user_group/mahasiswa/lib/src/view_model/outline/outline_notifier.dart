import 'package:core/core.dart';

import '../../model/model/admin_outline_model.dart';
import '../../model/model/mahasiswa_outline_model.dart';

final getAdminOutline = AutoDisposeFutureProvider(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/admin/outline",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = AdminOutlineModel.fromJson(Map.from(request.data));

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);

final getMahasiswaOutline = AutoDisposeFutureProvider(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/mahasiswa/outline/by-user-id/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = MahasiswaOutlineModel.fromJson(Map.from(request.data));

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);
