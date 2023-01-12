// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa_guidance_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaGuidanceDetailModel _$MahasiswaGuidanceDetailModelFromJson(
        Map<String, dynamic> json) =>
    MahasiswaGuidanceDetailModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MahasiswaGuidanceDetailData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MahasiswaGuidanceDetailModelToJson(
        MahasiswaGuidanceDetailModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MahasiswaGuidanceDetailData _$MahasiswaGuidanceDetailDataFromJson(
        Map<String, dynamic> json) =>
    MahasiswaGuidanceDetailData(
      id: json['id'] as String?,
      guidanceId: json['guidance_id'] as int?,
      userId: json['user_id'] as int?,
      groupId: json['group_id'] as int?,
      mstOutlineComponentId: json['mst_outline_component_id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      lectureNote: json['lecture_note'] as String?,
      status: $enumDecodeNullable(_$GuidanceStatusEnumMap, json['status']) ??
          GuidanceStatus.progress,
      file: json['file'] as String?,
      fileLecture: json['file_lecture'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$MahasiswaGuidanceDetailDataToJson(
        MahasiswaGuidanceDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guidance_id': instance.guidanceId,
      'user_id': instance.userId,
      'group_id': instance.groupId,
      'mst_outline_component_id': instance.mstOutlineComponentId,
      'title': instance.title,
      'description': instance.description,
      'lecture_note': instance.lectureNote,
      'status': _$GuidanceStatusEnumMap[instance.status]!,
      'file': instance.file,
      'file_lecture': instance.fileLecture,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

const _$GuidanceStatusEnumMap = {
  GuidanceStatus.approved: 'approved',
  GuidanceStatus.rejected: 'rejected',
  GuidanceStatus.progress: 'progress',
};
