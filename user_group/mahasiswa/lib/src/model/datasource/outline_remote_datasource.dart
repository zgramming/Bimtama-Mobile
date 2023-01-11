import 'package:core/core.dart';

import '../model/outline_upsert_response_model.dart';

class OutlineFormModel extends Equatable {
  final String token;
  final int userId;
  final int outlineId;
  const OutlineFormModel({
    required this.token,
    required this.userId,
    required this.outlineId,
  });

  @override
  List<Object> get props => [token, userId, outlineId];

  @override
  bool get stringify => true;
}

class OutlineRemoteDatasource {
  final Dio dio;
  const OutlineRemoteDatasource({
    required this.dio,
  });

  Future<OutlineUpsertResponseModel?> upsert(OutlineFormModel form) async {
    final formData = FormData.fromMap({
      "user_id": form.userId,
      "outline_id": form.outlineId,
    });

    final request = await dio.post(
      "/mahasiswa/outline",
      data: formData,
      options: Options(
        headers: {
          "Authorization": "Bearer ${form.token}",
        },
      ),
    );

    final response = OutlineUpsertResponseModel.fromJson(
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
