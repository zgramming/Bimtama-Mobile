// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_active_group_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureActiveGroupDetailModel _$LectureActiveGroupDetailModelFromJson(
        Map<String, dynamic> json) =>
    LectureActiveGroupDetailModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : LectureActiveGroupDetailData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LectureActiveGroupDetailModelToJson(
        LectureActiveGroupDetailModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LectureActiveGroupDetailData _$LectureActiveGroupDetailDataFromJson(
        Map<String, dynamic> json) =>
    LectureActiveGroupDetailData(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int?,
      groupMember: (json['group_member'] as List<dynamic>)
          .map((e) => GroupMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LectureActiveGroupDetailDataToJson(
        LectureActiveGroupDetailData instance) =>
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
      'group_member': instance.groupMember,
    };

GroupMember _$GroupMemberFromJson(Map<String, dynamic> json) => GroupMember(
      id: json['id'] as String,
      groupId: json['group_id'] as int,
      userId: json['user_id'] as int,
      isAdmin: json['is_admin'] as bool,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
    );

Map<String, dynamic> _$GroupMemberToJson(GroupMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'is_admin': instance.isAdmin,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
