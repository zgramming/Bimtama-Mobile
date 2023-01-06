// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureGroupModel _$LectureGroupModelFromJson(Map<String, dynamic> json) =>
    LectureGroupModel(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LectureGroupData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LectureGroupModelToJson(LectureGroupModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

LectureGroupData _$LectureGroupDataFromJson(Map<String, dynamic> json) =>
    LectureGroupData(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String?,
      image: json['image'],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int?,
    );

Map<String, dynamic> _$LectureGroupDataToJson(LectureGroupData instance) =>
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
