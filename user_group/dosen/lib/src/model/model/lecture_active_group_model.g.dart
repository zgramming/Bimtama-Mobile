// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_active_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureActiveGroupModel _$LectureActiveGroupModelFromJson(
        Map<String, dynamic> json) =>
    LectureActiveGroupModel(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LectureActiveGroupData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LectureActiveGroupModelToJson(
        LectureActiveGroupModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LectureActiveGroupData _$LectureActiveGroupDataFromJson(
        Map<String, dynamic> json) =>
    LectureActiveGroupData(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String,
      image: json['image'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int?,
    );

Map<String, dynamic> _$LectureActiveGroupDataToJson(
        LectureActiveGroupData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'image': instance.image,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
