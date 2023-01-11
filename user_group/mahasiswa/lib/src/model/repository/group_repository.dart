import 'package:core/core.dart';

import '../datasource/group_remote_datasource.dart';
import '../model/group_exit_response_model.dart';
import '../model/group_join_response_model.dart';

class GroupRepository {
  const GroupRepository({
    required this.remoteDatasource,
  });
  final GroupRemoteDatasource remoteDatasource;

  Future<Either<Failure, GroupJoinResponseModel?>> join(
      GroupJoinFormModel form) async {
    try {
      final result = await remoteDatasource.join(form);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  Future<Either<Failure, GroupExitResponseModel?>> exit(
      GroupExitFormModel form) async {
    try {
      final result = await remoteDatasource.exit(form);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
