import 'package:core/core.dart';

import '../../model/model/mahasiswa_profile_model.dart';
import '../../model/repository/profile_repository.dart';

class ProfileState extends Equatable {
  final AsyncValue<UserModel?> onUpdate;
  const ProfileState({
    this.onUpdate = const AsyncData(null),
  });

  @override
  List<Object> get props => [onUpdate];

  @override
  bool get stringify => true;

  ProfileState copyWith({
    AsyncValue<UserModel?>? onUpdate,
  }) {
    return ProfileState(
      onUpdate: onUpdate ?? this.onUpdate,
    );
  }
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileRepository repository;
  ProfileNotifier({
    required this.repository,
  }) : super(const ProfileState());

  Future<void> update(
    String token, {
    required int userId,
    required String name,
    required String phone,
  }) async {
    state = state.copyWith(onUpdate: const AsyncLoading());
    final result = await repository.update(
      token,
      userId: userId,
      name: name,
      phone: phone,
    );

    result.fold(
      (failure) => state = state.copyWith(
        onUpdate: AsyncError(failure.message, StackTrace.current),
      ),
      (response) => state = state.copyWith(onUpdate: AsyncData(response)),
    );
  }
}

final getProfile = AutoDisposeFutureProvider(
  (ref) async {
    final dio = ref.watch(dioClient);
    final user = ref.watch(userNotifier).item;
    final request = await dio.get(
      "/dosen/profile/${user?.data.id}",
      options: Options(
        headers: {"Authorization": "Bearer ${user?.token}"},
      ),
    );
    final response = MahasiswaProfileModel.fromJson(Map.from(request.data));

    if (!response.success) {
      throw response.message;
    }

    return response;
  },
);
