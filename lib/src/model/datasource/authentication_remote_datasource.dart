import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bimtama/src/model/model/login_response_model.dart';
import 'package:bimtama/src/model/model/register_response_model.dart';
import 'package:bimtama/src/utils/failure.dart';

class AuthenticationRemoteDatasource {
  final Dio dio;
  const AuthenticationRemoteDatasource({
    required this.dio,
  });

  Future<LoginData?> login({
    required String username,
    required String password,
  }) async {
    final formData = FormData.fromMap({
      "username": username,
      "password": password,
    });
    final request = await dio.post("/login", data: formData);

    final response = LoginResponseModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }

      throw CommonFailure(response.message);
    }

    final data = response.data;
    return data;
  }

  Future<RegisterData?> register({
    required String codeGroup,
    required String username,
    required String password,
  }) async {
    final formData = FormData.fromMap({
      "username": username,
      "password": password,
      "code_group": codeGroup,
    });
    final request = await dio.post("/beta/register", data: formData);
    final response = RegisterResponseModel.fromJson(request.data);

    if (!response.success) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }

      throw CommonFailure(response.message);
    }

    final data = response.data;
    return data;
  }
}

class AuthenticationRepository {
  final AuthenticationRemoteDatasource remoteDatasource;
  const AuthenticationRepository({
    required this.remoteDatasource,
  });

  Future<Either<Failure, LoginData?>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await remoteDatasource.login(
        username: username,
        password: password,
      );
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  Future<Either<Failure, RegisterData?>> register({
    required String username,
    required String password,
    required String codeGroup,
  }) async {
    try {
      final result = await remoteDatasource.register(
        username: username,
        password: password,
        codeGroup: codeGroup,
      );
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}

class AuthenticationNotifierState extends Equatable {
  final AsyncValue<LoginData?> onLogin;
  final AsyncValue<RegisterData?> onRegister;

  const AuthenticationNotifierState({
    this.onLogin = const AsyncData(null),
    this.onRegister = const AsyncData(null),
  });

  @override
  List<Object> get props => [onLogin, onRegister];

  @override
  bool get stringify => true;

  AuthenticationNotifierState copyWith({
    AsyncValue<LoginData?>? onLogin,
    AsyncValue<RegisterData?>? onRegister,
  }) {
    return AuthenticationNotifierState(
      onLogin: onLogin ?? this.onLogin,
      onRegister: onRegister ?? this.onRegister,
    );
  }
}

class AuthenticationNotifier
    extends StateNotifier<AuthenticationNotifierState> {
  final AuthenticationRepository repository;
  AuthenticationNotifier({
    required this.repository,
  }) : super(const AuthenticationNotifierState());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = state.copyWith(onLogin: const AsyncLoading());
    final result = await repository.login(
      username: username,
      password: password,
    );
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

  Future<void> register({
    required String username,
    required String password,
    required String codeGroup,
  }) async {
    state = state.copyWith(onRegister: const AsyncLoading());

    final result = await repository.register(
      username: username,
      password: password,
      codeGroup: codeGroup,
    );
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
}
