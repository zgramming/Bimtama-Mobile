import 'package:core/core.dart';

import '../../model/datasource/outline_remote_datasource.dart';
import '../../model/model/admin_outline_model.dart';
import '../../model/model/mahasiswa_outline_model.dart';
import '../../model/model/outline_upsert_response_model.dart';
import '../../model/repository/outline_repository.dart';

class OutlineState extends Equatable {
  final AsyncValue<OutlineUpsertResponseModel?> onUpsert;
  const OutlineState({
    this.onUpsert = const AsyncData(null),
  });

  @override
  List<Object> get props => [onUpsert];

  @override
  bool get stringify => true;

  OutlineState copyWith({
    AsyncValue<OutlineUpsertResponseModel?>? onUpsert,
  }) {
    return OutlineState(
      onUpsert: onUpsert ?? this.onUpsert,
    );
  }
}

class OutlineNotifier extends StateNotifier<OutlineState> {
  final OutlineRepository repository;
  OutlineNotifier({
    required this.repository,
  }) : super(const OutlineState());

  Future<void> upsert(OutlineFormModel form) async {
    final result = await repository.upsert(form);
    result.fold(
      (failure) => state = state.copyWith(
        onUpsert: AsyncError(failure.message, StackTrace.current),
      ),
      (response) => state = state.copyWith(onUpsert: AsyncData(response)),
    );
  }
}

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
