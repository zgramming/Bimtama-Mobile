import 'package:core/core.dart';

import '../../model/datasource/group_remote_datasource.dart';
import '../../model/model/group_exit_response_model.dart';
import '../../model/model/group_join_response_model.dart';
import '../../model/model/mahasiswa_mygroup_model.dart';
import '../../model/model/searched_group_model.dart';
import '../../model/repository/group_repository.dart';

class GroupState extends Equatable {
  const GroupState({
    this.onJoin = const AsyncData(null),
    this.onExit = const AsyncData(null),
  });

  final AsyncValue<GroupJoinResponseModel?> onJoin;
  final AsyncValue<GroupExitResponseModel?> onExit;

  @override
  List<Object> get props => [onJoin, onExit];

  @override
  bool get stringify => true;

  GroupState copyWith({
    AsyncValue<GroupJoinResponseModel?>? onJoin,
    AsyncValue<GroupExitResponseModel?>? onExit,
  }) {
    return GroupState(
      onJoin: onJoin ?? this.onJoin,
      onExit: onExit ?? this.onExit,
    );
  }
}

class GroupNotifier extends StateNotifier<GroupState> {
  final GroupRepository repository;
  GroupNotifier({
    required this.repository,
  }) : super(const GroupState());

  Future<void> join(GroupJoinFormModel form) async {
    state = state.copyWith(onJoin: const AsyncLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    final result = await repository.join(form);
    result.fold(
      (failure) => state = state.copyWith(
        onJoin: AsyncError(failure.message, StackTrace.current),
      ),
      (response) => state = state.copyWith(onJoin: AsyncData(response)),
    );
  }

  Future<void> exit(GroupExitFormModel form) async {
    state = state.copyWith(onExit: const AsyncLoading());
    await Future.delayed(const Duration(milliseconds: 500));
    final result = await repository.exit(form);
    result.fold(
      (failure) => state = state.copyWith(
        onExit: AsyncError(failure.message, StackTrace.current),
      ),
      (response) => state = state.copyWith(onExit: AsyncData(response)),
    );
  }
}

final getMyGroupList = AutoDisposeFutureProvider<MahasiswaMyGroupModel>(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/mahasiswa/my-group/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response =
        MahasiswaMyGroupModel.fromJson(Map<String, dynamic>.from(request.data));

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);

final getGroupByCode =
    AutoDisposeFutureProviderFamily<SearchedGroupModel, String>(
  (ref, code) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/mahasiswa/group/search-by-code/$code",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );

    final response =
        SearchedGroupModel.fromJson(Map<String, dynamic>.from(request.data));

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);
