import 'package:core/core.dart';

import '../datasource/guidance_remote_datasource.dart';
import '../model/guidance_update_response_model.dart';

class GuidanceRepository {
  const GuidanceRepository({
    required this.remoteDatasource,
  });

  final GuidanceRemoteDatasource remoteDatasource;

  Future<Either<Failure, GuidanceUpdateResponseModel>> update(
    GuidanceFormModel form,
  ) async {
    try {
      final result = await remoteDatasource.update(form);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
