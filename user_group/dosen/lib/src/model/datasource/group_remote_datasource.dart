import 'package:core/core.dart';

import '../model/group_active_update_response_model.dart';
import '../model/group_create_response_model.dart';
import '../model/group_update_response_model.dart';

class GroupRemoteDatasource {
  const GroupRemoteDatasource({
    required this.dio,
  });

  final Dio dio;

  Future<GroupCreateResponseModel> create(
    String token, {
    required String name,
    required String code,
    required String description,
    required int createdBy,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      'code': code,
      'description': description,
      'created_by': "$createdBy",
    });

    final request = await dio.post(
      "/dosen/group",
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    final response = GroupCreateResponseModel.fromJson(
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

  Future<GroupUpdateResponseModel> update(
    String token, {
    required int id,
    required String name,
    required String code,
    required String description,
    required int createdBy,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      'code': code,
      'description': description,
      'created_by': "$createdBy",
    });

    final request = await dio.put(
      "/dosen/group/$id",
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    final response = GroupUpdateResponseModel.fromJson(
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

  Future<GroupActiveUpdateResponseModel> updateActiveGroup(
    String token, {
    required int userId,
    required int groupId,
  }) async {
    final data = FormData.fromMap({'group_id': groupId});

    final request = await dio.put(
      "/dosen/my-group/$userId",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    final response = GroupActiveUpdateResponseModel.fromJson(
      Map.from(request.data),
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
