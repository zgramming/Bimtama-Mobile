import 'package:core/core.dart';

import '../model/group_exit_response_model.dart';
import '../model/group_join_response_model.dart';

class GroupJoinFormModel extends Equatable {
  const GroupJoinFormModel({
    required this.token,
    required this.userId,
    required this.groupId,
  });

  final String token;
  final int userId;
  final int groupId;

  @override
  List<Object> get props => [token, userId, groupId];

  @override
  bool get stringify => true;
}

class GroupExitFormModel extends Equatable {
  const GroupExitFormModel({
    required this.token,
    required this.userId,
    required this.groupId,
  });

  final String token;
  final int userId;
  final int groupId;

  @override
  List<Object> get props => [token, userId, groupId];

  @override
  bool get stringify => true;
}

class GroupRemoteDatasource {
  const GroupRemoteDatasource({
    required this.dio,
  });

  final Dio dio;

  Future<GroupJoinResponseModel?> join(GroupJoinFormModel form) async {
    final formData = FormData.fromMap({
      "user_id": form.userId,
      "group_id": form.groupId,
    });

    final request = await dio.post(
      "/mahasiswa/group/join",
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Bearer ${form.token}",
        },
      ),
    );

    final response = GroupJoinResponseModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }
      throw Exception(response.message);
    }

    return response;
  }

  Future<GroupExitResponseModel?> exit(GroupExitFormModel form) async {
    final formData = FormData.fromMap({
      "user_id": form.userId,
      "group_id": form.groupId,
    });

    final request = await dio.post(
      "/mahasiswa/group/exit",
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Bearer ${form.token}",
        },
      ),
    );

    final response = GroupExitResponseModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }
      throw Exception(response.message);
    }

    return response;
  }
}
