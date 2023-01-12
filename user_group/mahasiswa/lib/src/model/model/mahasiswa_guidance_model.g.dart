// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa_guidance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaGuidanceModel _$MahasiswaGuidanceModelFromJson(
        Map<String, dynamic> json) =>
    MahasiswaGuidanceModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : MahasiswaGuidanceData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MahasiswaGuidanceModelToJson(
        MahasiswaGuidanceModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MahasiswaGuidanceData _$MahasiswaGuidanceDataFromJson(
        Map<String, dynamic> json) =>
    MahasiswaGuidanceData(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      groupId: json['group_id'] as int?,
      currentProgresMstOutlineComponentId:
          json['current_progres_mst_outline_component_id'] as int?,
      title: json['title'] as String?,
      description: json['description'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$MahasiswaGuidanceDataToJson(
        MahasiswaGuidanceData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'group_id': instance.groupId,
      'current_progres_mst_outline_component_id':
          instance.currentProgresMstOutlineComponentId,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
