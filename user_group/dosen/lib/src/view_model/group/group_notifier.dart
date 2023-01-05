import 'package:core/core.dart';

import '../../model/model/group_create_response_model.dart';
import '../../model/model/group_update_response_model.dart';
import '../../model/model/lecture_active_group_detail_model.dart';
import '../../model/model/lecture_active_group_member_model.dart';
import '../../model/model/lecture_active_group_model.dart';
import '../../model/repository/group_repository.dart';

class GroupState extends Equatable {
  final AsyncValue<GroupCreateResponseModel?> onCreate;
  final AsyncValue<GroupUpdateResponseModel?> onUpdate;
  const GroupState({
    this.onCreate = const AsyncData(null),
    this.onUpdate = const AsyncData(null),
  });

  @override
  List<Object> get props => [onCreate, onUpdate];

  @override
  bool get stringify => true;

  GroupState copyWith({
    AsyncValue<GroupCreateResponseModel?>? onCreate,
    AsyncValue<GroupUpdateResponseModel?>? onUpdate,
  }) {
    return GroupState(
      onCreate: onCreate ?? this.onCreate,
      onUpdate: onUpdate ?? this.onUpdate,
    );
  }
}

class GroupNotifier extends StateNotifier<GroupState> {
  final GroupRepository repository;
  GroupNotifier({
    required this.repository,
  }) : super(const GroupState());

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
      (l) {
        state = state.copyWith(
          onUpdate: AsyncError(l.message, StackTrace.current),
        );
      },
      (r) {
        state = state.copyWith(
          onUpdate: AsyncData(r),
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

    return response;
  },
);
