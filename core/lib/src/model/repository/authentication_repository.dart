import 'package:dartz/dartz.dart';

import '../../utils/utils.dart';
import '../datasource/authentication_remote_datasource.dart';
import '../model/logout_response_model.dart';
import '../model/user_model.dart';

class AuthenticationRepository {
  final AuthenticationRemoteDatasource remoteDatasource;
  const AuthenticationRepository({
    required this.remoteDatasource,
  });

  Future<Either<Failure, UserModel?>> login(LoginFormModel form) async {
    try {
      final result = await remoteDatasource.login(form);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  Future<Either<Failure, UserModel?>> register(RegisterFormModel form) async {
    try {
      final result = await remoteDatasource.register(form);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  Future<Either<Failure, LogoutResponseModel>> logout(int userId) async {
    try {
      final result = await remoteDatasource.logout(userId);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
