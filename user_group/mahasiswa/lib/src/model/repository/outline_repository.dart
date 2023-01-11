import 'package:core/core.dart';

import '../datasource/outline_remote_datasource.dart';
import '../model/outline_upsert_response_model.dart';

class OutlineRepository {
  const OutlineRepository({
    required this.remoteDatasource,
  });
  final OutlineRemoteDatasource remoteDatasource;

  Future<Either<Failure, OutlineUpsertResponseModel?>> upsert(
      OutlineFormModel form) async {
    try {
      final result = await remoteDatasource.upsert(form);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
