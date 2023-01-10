import 'package:core/core.dart';

import '../model/profile_update_response_model.dart';

class ProfileRemoteDatasource {
  const ProfileRemoteDatasource({
    required this.dio,
  });

  final Dio dio;

  Future<UserModel> update(
    String token, {
    required int userId,
    required String name,
    required String phone,
  }) async {
    final data = FormData.fromMap({
      "user_id": userId,
      "name": name,
      "phone": phone,
    });
    final request = await dio.put(
      "/mahasiswa/profile",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    final response = ProfileUpdateResponseModel.fromJson(
      Map.from(request.data),
    );

    if (!response.success) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }
      throw Exception(response.message);
    }

    final user = response.data;

    if (user == null) {
      throw Exception("User tidak valid");
    }

    return UserModel(
      data: user,
      token: response.token ?? "",
    );
  }
}
