import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/model/datasource/authentication_remote_datasource.dart';
import 'src/utils/constant.dart';
import 'src/view_model/user/user_notifier.dart';

final userNotifier = StateNotifierProvider<UserNotifier, UserState>(
  (ref) => UserNotifier(),
);

final authenticationNotifier =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationNotifierState>(
        (ref) {
  return AuthenticationNotifier(
      repository: ref.watch(_authenticationRepository));
});

final _authenticationRepository = Provider((ref) => AuthenticationRepository(
    remoteDatasource: ref.watch(_authenticationRemoteDatasource)));

final _authenticationRemoteDatasource = Provider(
  (ref) => AuthenticationRemoteDatasource(dio: ref.watch(dioClient)),
);

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
