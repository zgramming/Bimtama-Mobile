import 'package:core/core.dart';

import '../../model/datasource/schedule_meeting_remote_datasource.dart';
import '../../model/model/lecture_schedule_meeting_detail_model.dart';
import '../../model/model/lecture_schedule_meeting_model.dart';
import '../../model/model/schedule_meeting_create_update_response_model.dart';
import '../../model/repository/schedule_meeting_repository.dart';

class ScheduleMeetingState extends Equatable {
  const ScheduleMeetingState({
    this.onCreate = const AsyncData(null),
    this.onUpdate = const AsyncData(null),
  });
  final AsyncValue<ScheduleMeetingCreateUpdateResponseModel?> onCreate;
  final AsyncValue<ScheduleMeetingCreateUpdateResponseModel?> onUpdate;

  @override
  List<Object> get props => [onCreate, onUpdate];

  @override
  bool get stringify => true;

  ScheduleMeetingState copyWith({
    AsyncValue<ScheduleMeetingCreateUpdateResponseModel?>? onCreate,
    AsyncValue<ScheduleMeetingCreateUpdateResponseModel?>? onUpdate,
  }) {
    return ScheduleMeetingState(
      onCreate: onCreate ?? this.onCreate,
      onUpdate: onUpdate ?? this.onUpdate,
    );
  }
}

class ScheduleMeetingNotifier extends StateNotifier<ScheduleMeetingState> {
  ScheduleMeetingNotifier({
    required this.repository,
  }) : super(const ScheduleMeetingState());

  final ScheduleMeetingRepository repository;

  Future<void> create(ScheduleMeetingFormModel form) async {
    state = state.copyWith(onCreate: const AsyncLoading());
    final result = await repository.create(form);
    result.fold(
      (failure) => state = state.copyWith(
        onCreate: AsyncError(
          failure.message,
          StackTrace.current,
        ),
      ),
      (response) => state = state.copyWith(
        onCreate: AsyncData(response),
      ),
    );
  }

  Future<void> createPersonal(
    int studentId, {
    required ScheduleMeetingFormModel form,
  }) async {
    state = state.copyWith(onCreate: const AsyncLoading());
    final result = await repository.createPersonal(
      studentId,
      form: form,
    );
    result.fold(
      (failure) => state = state.copyWith(
        onCreate: AsyncError(
          failure.message,
          StackTrace.current,
        ),
      ),
      (response) => state = state.copyWith(
        onCreate: AsyncData(response),
      ),
    );
  }

  Future<void> update(int id, {required ScheduleMeetingFormModel form}) async {
    state = state.copyWith(onUpdate: const AsyncLoading());
    final result = await repository.update(id, form: form);
    result.fold(
      (failure) => state = state.copyWith(
        onUpdate: AsyncError(
          failure.message,
          StackTrace.current,
        ),
      ),
      (response) => state = state.copyWith(
        onUpdate: AsyncData(response),
      ),
    );
  }

  Future<void> updatePersonal(
    int id,
    int studentId, {
    required ScheduleMeetingFormModel form,
  }) async {
    state = state.copyWith(onUpdate: const AsyncLoading());
    final result = await repository.updatePersonal(
      id,
      studentId,
      form: form,
    );
    result.fold(
      (failure) => state = state.copyWith(
        onUpdate: AsyncError(
          failure.message,
          StackTrace.current,
        ),
      ),
      (response) => state = state.copyWith(
        onUpdate: AsyncData(response),
      ),
    );
  }
}

final getScheduleMeetingByType =
    AutoDisposeFutureProviderFamily<LectureScheduleMeetingModel, String>(
  (ref, type) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;

    final request = await dio.get(
      "/dosen/meeting-schedule/${user?.data.id}/type/$type",
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

final getScheduleMeetingById =
    AutoDisposeFutureProviderFamily<LectureScheduleMeetingDetailModel, int>(
  (ref, id) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;

    final request = await dio.get(
      "/dosen/meeting-schedule/$id",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = LectureScheduleMeetingDetailModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);
