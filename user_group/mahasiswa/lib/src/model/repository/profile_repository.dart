import 'package:core/core.dart';

import '../datasource/profile_remote_datasource.dart';

class ProfileRepository {
  const ProfileRepository({
    required this.remoteDatasource,
  });

  final ProfileRemoteDatasource remoteDatasource;

  Future<Either<Failure, UserModel>> update(
    String token, {
    required int userId,
    required String name,
    required String phone,
  }) async {
    try {
      final result = await remoteDatasource.update(
        token,
        userId: userId,
        name: name,
        phone: phone,
      );
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
