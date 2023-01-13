// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:core/core.dart';

import '../model/guidance_start_response_model.dart';
import '../model/guidance_submission_response_model.dart';

class GuidanceSubmissionFormModel extends Equatable {
  const GuidanceSubmissionFormModel({
    required this.userId,
    required this.codeMasterOutlineComponent,
    required this.token,
    required this.title,
    this.description,
    this.file,
  });

  final int userId;
  final String codeMasterOutlineComponent;
  final String token;
  final String title;
  final String? description;
  final File? file;

  @override
  List<Object?> get props {
    return [
      userId,
      token,
      title,
      description,
      file,
    ];
  }

  @override
  bool get stringify => true;
}

class GuidanceRemoteDatasource {
  const GuidanceRemoteDatasource({
    required this.dio,
  });

  final Dio dio;

  Future<GuidanceSubmissionResponseModel> submission(
    GuidanceSubmissionFormModel form,
  ) async {
    final data = FormData.fromMap(
      {
        'user_id': form.userId,
        'title': form.title,
        'code_master_outline_component': form.codeMasterOutlineComponent,
        if (form.description != null) 'description': form.description,
        if (form.file != null)
          'file': await MultipartFile.fromFile(
            form.file!.path,
            contentType: MediaType.parse(
              lookupMimeType(form.file!.path) ?? "",
            ),
          ),
      },
    );

    final request = await dio.post(
      "/mahasiswa/guidance/submission",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer ${form.token}",
        },
      ),
    );

    final response = GuidanceSubmissionResponseModel.fromJson(
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
