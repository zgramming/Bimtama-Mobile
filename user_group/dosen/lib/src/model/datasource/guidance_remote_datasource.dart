import 'dart:io';

import 'package:core/core.dart';
import 'package:dosen/src/model/model/lecture_guidance_detail_outline_model.dart';

import '../model/guidance_update_response_model.dart';

class GuidanceFormModel extends Equatable {
  const GuidanceFormModel({
    required this.token,
    required this.id,
    required this.lectureNote,
    required this.status,
    this.file,
  });

  final String token;
  final String id;
  final String lectureNote;
  final GuidanceStatus status;
  final File? file;

  @override
  List<Object?> get props => [id, lectureNote, status, file];

  @override
  bool get stringify => true;
}

class GuidanceRemoteDatasource {
  const GuidanceRemoteDatasource({
    required this.dio,
  });

  final Dio dio;

  Future<GuidanceUpdateResponseModel> update(GuidanceFormModel form) async {
    final data = FormData.fromMap({
      "lecture_note": form.lectureNote,
      "status": form.status.name,
      if (form.file != null)
        "file": await MultipartFile.fromFile(
          form.file?.path ?? "",
        )
    });

    final request = await dio.put(
      "/dosen/guidance/detail/submission/${form.id}",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer ${form.token}",
        },
      ),
    );

    final response = GuidanceUpdateResponseModel.fromJson(
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
