import 'package:dio/dio.dart';
import 'package:dosen/dosen.dart' as dosen;
import 'package:mahasiswa/mahasiswa.dart' as mahasiswa;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/model/datasource/authentication_remote_datasource.dart';
import 'src/utils/constant.dart';
import 'src/view_model/user/user_notifier.dart';

//! Start Notifier
final userNotifier = StateNotifierProvider<UserNotifier, UserState>(
  (ref) => UserNotifier(),
);

final authenticationNotifier =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationNotifierState>(
        (ref) {
  return AuthenticationNotifier(
      repository: ref.watch(_authenticationRepository));
});

final lectureGroupNotifier =
    StateNotifierProvider<dosen.GroupNotifier, dosen.GroupState>(
  (ref) => dosen.GroupNotifier(
    repository: ref.watch(_lectureGroupRepository),
  ),
);

final lectureScheduleMeetingNotifier = StateNotifierProvider<
        dosen.ScheduleMeetingNotifier, dosen.ScheduleMeetingState>(
    (ref) => dosen.ScheduleMeetingNotifier(
        repository: ref.watch(_lectureScheduleMeetingRepository)));

final lectureProfileNotifier =
    StateNotifierProvider<dosen.ProfileNotifier, dosen.ProfileState>((ref) =>
        dosen.ProfileNotifier(
            repository: ref.watch(_lectureProfileRepository)));

final lectureGuidanceNotifier =
    StateNotifierProvider<dosen.GuidanceNotifier, dosen.GuidanceState>((ref) =>
        dosen.GuidanceNotifier(
            repository: ref.watch(_lectureGuidanceRepositoru)));

final mahasiswaProfileNotifier =
    StateNotifierProvider<mahasiswa.ProfileNotifier, mahasiswa.ProfileState>(
        (ref) => mahasiswa.ProfileNotifier(
            repository: ref.watch(_mahasiswaProfileRepository)));

//! Start Repository
final _authenticationRepository = Provider((ref) => AuthenticationRepository(
    remoteDatasource: ref.watch(_authenticationRemoteDatasource)));

final _lectureGroupRepository = Provider((ref) => dosen.GroupRepository(
    remoteDatasource: ref.watch(_lectureGroupRemoteDatasource)));

final _lectureScheduleMeetingRepository = Provider((ref) =>
    dosen.ScheduleMeetingRepository(
        remoteDatasource: ref.watch(_lectureScheduleMeetingRemoteDatasource)));

final _lectureProfileRepository = Provider((ref) => dosen.ProfileRepository(
    remoteDatasource: ref.watch(_lectureProfileRemoteDatasource)));

final _lectureGuidanceRepositoru = Provider((ref) => dosen.GuidanceRepository(
    remoteDatasource: ref.watch(_lectureGuidanceRemoteDatasource)));

final _mahasiswaProfileRepository = Provider((ref) =>
    mahasiswa.ProfileRepository(
        remoteDatasource: ref.watch(_mahasiswaProfileRemoteDatasource)));

//! Start Datasource
final _authenticationRemoteDatasource = Provider(
  (ref) => AuthenticationRemoteDatasource(dio: ref.watch(dioClient)),
);

final _lectureGroupRemoteDatasource =
    Provider((ref) => dosen.GroupRemoteDatasource(dio: ref.watch(dioClient)));

final _lectureScheduleMeetingRemoteDatasource = Provider(
  (ref) => dosen.ScheduleMeetingRemoteDatasource(
    dio: ref.watch(dioClient),
  ),
);

final _lectureProfileRemoteDatasource = Provider(
  (ref) => dosen.ProfileRemoteDatasource(dio: ref.watch(dioClient)),
);

final _lectureGuidanceRemoteDatasource = Provider(
  (ref) => dosen.GuidanceRemoteDatasource(dio: ref.watch(dioClient)),
);

final _mahasiswaProfileRemoteDatasource = Provider(
    (ref) => mahasiswa.ProfileRemoteDatasource(dio: ref.watch(dioClient)));

//! Start Utils
final dioClient = Provider((ref) {
  final options = BaseOptions(
    baseUrl: baseAPIURL,
    connectTimeout: 10000, // 10 Second
    followRedirects: false,
    validateStatus: (status) {
      if (status == null) return false;
      return status < 500;
    },
  );
  final dio = Dio(options);

  return dio;
});
