import 'package:core/core.dart';

import '../datasource/group_remote_datasource.dart';
import '../model/group_active_update_response_model.dart';
import '../model/group_create_response_model.dart';
import '../model/group_update_response_model.dart';

class GroupRepository {
  final GroupRemoteDatasource remoteDatasource;
  const GroupRepository({
    required this.remoteDatasource,
  });

  Future<Either<Failure, GroupCreateResponseModel>> create(
    String token, {
    required String name,
    required String code,
    required String description,
    required int createdBy,
  }) async {
    try {
      final result = await remoteDatasource.create(
        token,
        name: name,
        code: code,
        description: description,
        createdBy: createdBy,
      );
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  Future<Either<Failure, GroupUpdateResponseModel>> update(
    String token, {
    required int id,
    required String name,
    required String code,
    required String description,
    required int createdBy,
  }) async {
    try {
      final result = await remoteDatasource.update(
        token,
        id: id,
        name: name,
        code: code,
        description: description,
        createdBy: createdBy,
      );
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  Future<Either<Failure, GroupActiveUpdateResponseModel>> updateActiveGroup(
    String token, {
    required int userId,
    required int groupId,
  }) async {
    try {
      final result = await remoteDatasource.updateActiveGroup(
        token,
        userId: userId,
        groupId: groupId,
      );
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
