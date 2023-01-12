import 'package:core/core.dart';

import '../model/guidance_start_response_model.dart';

class GuidanceRemoteDatasource {
  const GuidanceRemoteDatasource({
    required this.dio,
  });

  final Dio dio;

  Future<GuidanceStartResponseModel?> start(
    String token, {
    required int userId,
  }) async {
    final data = FormData.fromMap({
      'user_id': userId,
    });

    final request = await dio.post(
      "/mahasiswa/guidance/submission/start",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    final response = GuidanceStartResponseModel.fromJson(
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
