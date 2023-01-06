import 'package:core/core.dart';

import '../datasource/schedule_meeting_remote_datasource.dart';
import '../model/schedule_meeting_create_update_response_model.dart';

class ScheduleMeetingRepository {
  final ScheduleMeetingRemoteDatasource remoteDatasource;

  const ScheduleMeetingRepository({
    required this.remoteDatasource,
  });

  Future<Either<Failure, ScheduleMeetingCreateUpdateResponseModel>> create(
    ScheduleMeetingFormModel form,
  ) async {
    try {
      final result = await remoteDatasource.create(form);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  Future<Either<Failure, ScheduleMeetingCreateUpdateResponseModel>>
      createPersonal(
    int studentId, {
    required ScheduleMeetingFormModel form,
  }) async {
    try {
      final result =
          await remoteDatasource.createPersonal(studentId, form: form);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  Future<Either<Failure, ScheduleMeetingCreateUpdateResponseModel>> update(
    int id, {
    required ScheduleMeetingFormModel form,
  }) async {
    try {
      final result = await remoteDatasource.update(id, form: form);
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  Future<Either<Failure, ScheduleMeetingCreateUpdateResponseModel>>
      updatePersonal(
    int id,
    int studentId, {
    required ScheduleMeetingFormModel form,
  }) async {
    try {
      final result = await remoteDatasource.updatePersonal(
        id,
        studentId,
        form: form,
      );
      return Right(result);
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
