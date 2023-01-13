// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guidance_submission_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuidanceSubmissionResponseModel _$GuidanceSubmissionResponseModelFromJson(
        Map<String, dynamic> json) =>
    GuidanceSubmissionResponseModel(
      success: json['success'] as bool,
      message: json['message'],
      data: json['data'] == null
          ? null
          : GuidanceSubmissionResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GuidanceSubmissionResponseModelToJson(
        GuidanceSubmissionResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

GuidanceSubmissionResponseData _$GuidanceSubmissionResponseDataFromJson(
        Map<String, dynamic> json) =>
    GuidanceSubmissionResponseData(
      id: json['id'] as String?,
      guidanceId: json['guidance_id'] as int?,
      userId: json['user_id'] as int?,
      groupId: json['group_id'] as int?,
      mstOutlineComponentId: json['mst_outline_component_id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      lectureNote: json['lecture_note'],
      status: json['status'] as String?,
      file: json['file'] as String?,
      fileLecture: json['file_lecture'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$GuidanceSubmissionResponseDataToJson(
        GuidanceSubmissionResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guidance_id': instance.guidanceId,
      'user_id': instance.userId,
      'group_id': instance.groupId,
      'mst_outline_component_id': instance.mstOutlineComponentId,
      'title': instance.title,
      'description': instance.description,
      'lecture_note': instance.lectureNote,
      'status': instance.status,
      'file': instance.file,
      'file_lecture': instance.fileLecture,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
