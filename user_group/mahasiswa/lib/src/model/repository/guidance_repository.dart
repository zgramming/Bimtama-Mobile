import 'package:core/core.dart';

import '../datasource/guidance_remote_datasource.dart';
import '../model/guidance_start_response_model.dart';

class GuidanceRepository {
  const GuidanceRepository({
    required this.remoteDatasource,
  });

  final GuidanceRemoteDatasource remoteDatasource;

  Future<Either<Failure, GuidanceStartResponseModel?>> start(
    String token, {
    required int userId,
  }) async {
    try {
      final result = await remoteDatasource.start(token, userId: userId);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
