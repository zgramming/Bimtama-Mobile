import 'package:core/core.dart';
import 'package:mahasiswa/src/model/datasource/guidance_remote_datasource.dart';

import '../../model/model/guidance_start_response_model.dart';
import '../../model/model/guidance_submission_response_model.dart';
import '../../model/model/mahasiswa_guidance_detail_model.dart';
import '../../model/model/mahasiswa_guidance_model.dart';
import '../../model/model/mahasiswa_guidance_outline_model.dart';
import '../../model/model/mahasiswa_guidance_progress_model.dart';
import '../../model/repository/guidance_repository.dart';

class _GuidanceOutlineData extends Equatable {
  const _GuidanceOutlineData({
    required this.outline,
    required this.progress,
  });

  final MahasiswaGuidanceOutlineModel outline;
  final MahasiswaGuidanceProgressModel progress;

  @override
  List<Object> get props => [outline, progress];

  @override
  bool get stringify => true;
}

class GuidanceState extends Equatable {
  const GuidanceState({
    this.onStart = const AsyncData(null),
    this.onSubmission = const AsyncData(null),
  });

  final AsyncValue<GuidanceStartResponseModel?> onStart;
  final AsyncValue<GuidanceSubmissionResponseModel?> onSubmission;

  @override
  List<Object> get props => [onStart, onSubmission];

  @override
  bool get stringify => true;

  GuidanceState copyWith({
    AsyncValue<GuidanceStartResponseModel?>? onStart,
    AsyncValue<GuidanceSubmissionResponseModel?>? onSubmission,
  }) {
    return GuidanceState(
      onStart: onStart ?? this.onStart,
      onSubmission: onSubmission ?? this.onSubmission,
    );
  }
}

class GuidanceNotifier extends StateNotifier<GuidanceState> {
  final GuidanceRepository repository;
  GuidanceNotifier({
    required this.repository,
  }) : super(const GuidanceState());

  Future<void> start(
    String token, {
    required int userId,
  }) async {
    final result = await repository.start(token, userId: userId);
    result.fold(
      (failure) => state = state.copyWith(
        onStart: AsyncError(failure.message, StackTrace.current),
      ),
      (response) => state = state.copyWith(onStart: AsyncData(response)),
    );
  }

  Future<void> submission(GuidanceSubmissionFormModel form) async {
    final result = await repository.submission(form);
    result.fold(
      (failure) => state = state.copyWith(
        onSubmission: AsyncError(failure.message, StackTrace.current),
      ),
      (response) => state = state.copyWith(onSubmission: AsyncData(response)),
    );
  }
}

final getGuidance = AutoDisposeFutureProvider(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/mahasiswa/guidance/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = MahasiswaGuidanceModel.fromJson(Map.from(request.data));

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);

final getGuidanceOutline = AutoDisposeFutureProvider(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/mahasiswa/guidance/outline/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = MahasiswaGuidanceOutlineModel.fromJson(
      Map.from(request.data),
    );

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);

final getGuidanceProgress = AutoDisposeFutureProvider(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/mahasiswa/guidance/progress/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = MahasiswaGuidanceProgressModel.fromJson(
      Map.from(request.data),
    );

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);

final getGuidanceDetail =
    AutoDisposeFutureProviderFamily<MahasiswaGuidanceDetailModel, String>(
  (ref, code) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/mahasiswa/guidance/detail/${user?.data.id}/code/$code",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );
    final response = MahasiswaGuidanceDetailModel.fromJson(
      Map.from(request.data),
    );

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);

final initializeGuidanceOutline =
    AutoDisposeFutureProvider<_GuidanceOutlineData>(
  (ref) async {
    final outline = await ref.watch(getGuidanceOutline.future);
    final progress = await ref.watch(getGuidanceProgress.future);
    return _GuidanceOutlineData(
      outline: outline,
      progress: progress,
    );
  },
);

final guidanceMenuIsAccessible = Provider.autoDispose.family<bool, String?>(
  (ref, mstOutlineComponentCode) {
    final progress = ref.watch(getGuidanceProgress).valueOrNull;
    final progressMenu = (progress?.data ?? [])
        .map((e) => e?.mstOutlineComponent?.code)
        .toList();
    return progressMenu.contains(mstOutlineComponentCode);
  },
);
