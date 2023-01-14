import 'package:core/src/model/datasource/authentication_remote_datasource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/model/logout_response_model.dart';
import '../../model/model/user_model.dart';
import '../../model/repository/authentication_repository.dart';

class AuthenticationNotifierState extends Equatable {
  final AsyncValue<UserModel?> onLogin;
  final AsyncValue<UserModel?> onRegister;
  final AsyncValue<LogoutResponseModel?> onLogout;

  const AuthenticationNotifierState({
    this.onLogin = const AsyncData(null),
    this.onRegister = const AsyncData(null),
    this.onLogout = const AsyncData(null),
  });

  @override
  List<Object> get props => [onLogin, onRegister, onLogout];

  @override
  bool get stringify => true;

  AuthenticationNotifierState copyWith({
    AsyncValue<UserModel?>? onLogin,
    AsyncValue<UserModel?>? onRegister,
    AsyncValue<LogoutResponseModel?>? onLogout,
  }) {
    return AuthenticationNotifierState(
      onLogin: onLogin ?? this.onLogin,
      onRegister: onRegister ?? this.onRegister,
      onLogout: onLogout ?? this.onLogout,
    );
  }
}

class AuthenticationNotifier
    extends StateNotifier<AuthenticationNotifierState> {
  final AuthenticationRepository repository;
  AuthenticationNotifier({
    required this.repository,
  }) : super(const AuthenticationNotifierState());

  Future<void> login(LoginFormModel form) async {
    state = state.copyWith(onLogin: const AsyncLoading());

    final result = await repository.login(form);
    result.fold(
      (failure) {
        state = state.copyWith(
          onLogin: AsyncError(
            failure.message,
            StackTrace.current,
          ),
        );
      },
      (data) => state = state.copyWith(onLogin: AsyncData(data)),
    );
  }

  Future<void> register(RegisterFormModel form) async {
    state = state.copyWith(onRegister: const AsyncLoading());

    final result = await repository.register(form);
    result.fold(
      (failure) {
        state = state.copyWith(
          onRegister: AsyncError(
            failure.message,
            StackTrace.current,
          ),
        );
      },
      (data) => state = state.copyWith(onRegister: AsyncData(data)),
    );
  }

  Future<void> logout(int userId) async {
    state = state.copyWith(onLogout: const AsyncLoading());

    final result = await repository.logout(userId);
    result.fold(
      (failure) {
        state = state.copyWith(
          onLogout: AsyncError(
            failure.message,
            StackTrace.current,
          ),
        );
      },
      (data) => state = state.copyWith(onLogout: AsyncData(data)),
    );
  }
}
