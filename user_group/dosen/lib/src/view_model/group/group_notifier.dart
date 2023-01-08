import 'package:core/core.dart';

import '../../model/model/group_active_update_response_model.dart';
import '../../model/model/group_create_response_model.dart';
import '../../model/model/group_update_response_model.dart';
import '../../model/model/lecture_active_group_detail_model.dart';
import '../../model/model/lecture_active_group_member_model.dart';
import '../../model/model/lecture_active_group_model.dart';
import '../../model/model/lecture_group_model.dart';
import '../../model/repository/group_repository.dart';

class GroupState extends Equatable {
  final AsyncValue<GroupCreateResponseModel?> onCreate;
  final AsyncValue<GroupUpdateResponseModel?> onUpdate;
  final AsyncValue<GroupActiveUpdateResponseModel?> onUpdateActiveGroup;
  const GroupState({
    this.onCreate = const AsyncData(null),
    this.onUpdate = const AsyncData(null),
    this.onUpdateActiveGroup = const AsyncData(null),
  });

  @override
  List<Object> get props => [onCreate, onUpdate, onUpdateActiveGroup];

  @override
  bool get stringify => true;

  GroupState copyWith({
    AsyncValue<GroupCreateResponseModel?>? onCreate,
    AsyncValue<GroupUpdateResponseModel?>? onUpdate,
    AsyncValue<GroupActiveUpdateResponseModel?>? onUpdateActiveGroup,
  }) {
    return GroupState(
      onCreate: onCreate ?? this.onCreate,
      onUpdate: onUpdate ?? this.onUpdate,
      onUpdateActiveGroup: onUpdateActiveGroup ?? this.onUpdateActiveGroup,
    );
  }
}

class GroupNotifier extends StateNotifier<GroupState> {
  final GroupRepository repository;
  GroupNotifier({
    required this.repository,
  }) : super(const GroupState());

  Future<void> updateActiveGroup(
    String token, {
    required int userId,
    required int groupId,
  }) async {
    state = state.copyWith(onUpdateActiveGroup: const AsyncLoading());
    final result = await repository.updateActiveGroup(
      token,
      userId: userId,
      groupId: groupId,
    );

    result.fold(
      (failure) => state = state.copyWith(
        onUpdateActiveGroup: AsyncError(failure.message, StackTrace.current),
      ),
      (response) => state = state.copyWith(
        onUpdateActiveGroup: AsyncData(response),
      ),
    );
  }

  Future<void> update(
    String token, {
    required int id,
    required String name,
    required String code,
    required String description,
    required int createdBy,
  }) async {
    state = state.copyWith(onUpdate: const AsyncLoading());
    final result = await repository.update(
      token,
      id: id,
      name: name,
      code: code,
      description: description,
      createdBy: createdBy,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          onUpdate: AsyncError(failure.message, StackTrace.current),
        );
      },
      (response) {
        state = state.copyWith(
          onUpdate: AsyncData(response),
        );
      },
    );
  }

  Future<void> create(
    String token, {
    required String name,
    required String code,
    required String description,
    required int createdBy,
  }) async {
    state = state.copyWith(onCreate: const AsyncLoading());
    final result = await repository.create(
      token,
      name: name,
      code: code,
      description: description,
      createdBy: createdBy,
    );

    result.fold(
      (l) => state = state.copyWith(
        onCreate: AsyncError(l.message, StackTrace.current),
      ),
      (r) => state = state.copyWith(onCreate: AsyncData(r)),
    );
  }
}

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

final getActiveGroupMember = AutoDisposeFutureProvider((ref) async {
  final dio = ref.watch(dioClient);
  final user = ref.watch(userNotifier).item;
  final request = await dio.get(
    "/dosen/my-group/active/member/${user?.data.id}",
    options: Options(
      headers: {"Authorization": "Bearer ${user?.token}"},
    ),
  );
  final response = LectureActiveGroupMemberModel.fromJson(
    Map<String, dynamic>.from(request.data),
  );

  if (!response.success) {
    throw response.message;
  }

  return response;
});

final getActiveGroupDetail =
    AutoDisposeFutureProviderFamily<LectureActiveGroupDetailModel, int>(
  (ref, id) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/dosen/group/$id",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response = LectureActiveGroupDetailModel.fromJson(
      Map.from(request.data),
    );

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);

final getMyGroupList = AutoDisposeFutureProvider(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/dosen/my-group/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response =
        LectureGroupModel.fromJson(Map<String, dynamic>.from(request.data));

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);
