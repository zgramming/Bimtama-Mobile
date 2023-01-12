// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa_guidance_progress_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaGuidanceProgressModel _$MahasiswaGuidanceProgressModelFromJson(
        Map<String, dynamic> json) =>
    MahasiswaGuidanceProgressModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MahasiswaGuidanceProgressData.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MahasiswaGuidanceProgressModelToJson(
        MahasiswaGuidanceProgressModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MahasiswaGuidanceProgressData _$MahasiswaGuidanceProgressDataFromJson(
        Map<String, dynamic> json) =>
    MahasiswaGuidanceProgressData(
      id: json['id'] as int?,
      guidanceId: json['guidance_id'] as int?,
      userId: json['user_id'] as int?,
      mstOutlineComponentId: json['mst_outline_component_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$MahasiswaGuidanceProgressDataToJson(
        MahasiswaGuidanceProgressData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guidance_id': instance.guidanceId,
      'user_id': instance.userId,
      'mst_outline_component_id': instance.mstOutlineComponentId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
