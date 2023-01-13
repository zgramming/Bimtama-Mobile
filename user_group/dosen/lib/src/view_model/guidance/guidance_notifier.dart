import 'dart:developer';

import 'package:core/core.dart';

import '../../model/datasource/guidance_remote_datasource.dart';
import '../../model/model/guidance_update_response_model.dart';
import '../../model/model/lecture_guidance_detail_model.dart';
import '../../model/model/lecture_guidance_detail_outline_model.dart';
import '../../model/model/lecture_guidance_master_outline_model.dart';
import '../../model/repository/guidance_repository.dart';

class GuidanceState extends Equatable {
  const GuidanceState({
    this.onUpdate = const AsyncData(null),
  });

  final AsyncValue<GuidanceUpdateResponseModel?> onUpdate;

  @override
  List<Object> get props => [onUpdate];

  @override
  bool get stringify => true;

  GuidanceState copyWith({
    AsyncValue<GuidanceUpdateResponseModel?>? onUpdate,
  }) {
    return GuidanceState(
      onUpdate: onUpdate ?? this.onUpdate,
    );
  }
}

class GuidanceNotifier extends StateNotifier<GuidanceState> {
  final GuidanceRepository repository;
  GuidanceNotifier({
    required this.repository,
  }) : super(const GuidanceState());

  Future<void> update(GuidanceFormModel form) async {
    state = state.copyWith(onUpdate: const AsyncLoading());
    final result = await repository.update(form);
    result.fold(
      (failure) => state = state.copyWith(
        onUpdate: AsyncError(failure.message, StackTrace.current),
      ),
      (response) => state = state.copyWith(onUpdate: AsyncData(response)),
    );
  }
}

final selectedFilterGuidanceState =
    StateProvider((ref) => GuidanceStatus.progress);

final getGuidanceDetail = AutoDisposeFutureProviderFamily(
  (ref, id) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;

    final request = await dio.get(
      "/dosen/guidance/detail/submission/$id",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    log("request $request || ${request.realUri}");

    final response = LectureGuidanceDetailModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);

final getGuidanceMasterOutline =
    AutoDisposeFutureProvider<LectureGuidanceMasterOutlineModel>(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;

    final request = await dio.get(
      "/dosen/guidance/master-outline-component/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = LectureGuidanceMasterOutlineModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      throw Exception(response.message);
    }

    return response;
  },
);

final getGuidanceDetailByCodeOutlineComponent = AutoDisposeFutureProviderFamily(
  (ref, codeMasterOutlineComponent) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final userId = user?.data.id;
    final selectedFilter = ref.watch(selectedFilterGuidanceState);

    final request = await dio.get(
      "/dosen/guidance/detail/$userId/code-master-outline-component/$codeMasterOutlineComponent",
      queryParameters: {
        "status": selectedFilter.name,
      },
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );
    final response = LectureGuidanceDetailDetailOutlineModel.fromJson(
      Map.from(request.data),
    );

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);
