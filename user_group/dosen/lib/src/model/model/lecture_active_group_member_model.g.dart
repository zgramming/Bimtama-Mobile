// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_active_group_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureActiveGroupMemberModel _$LectureActiveGroupMemberModelFromJson(
        Map<String, dynamic> json) =>
    LectureActiveGroupMemberModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              LectureActiveGroupMemberData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LectureActiveGroupMemberModelToJson(
        LectureActiveGroupMemberModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LectureActiveGroupMemberData _$LectureActiveGroupMemberDataFromJson(
        Map<String, dynamic> json) =>
    LectureActiveGroupMemberData(
      id: json['id'] as String,
      groupId: json['group_id'] as int,
      userId: json['user_id'] as int,
      isAdmin: json['is_admin'] as bool,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LectureActiveGroupMemberDataToJson(
        LectureActiveGroupMemberData instance) =>
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
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      appGroupUserId: json['app_group_user_id'] as int,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'app_group_user_id': instance.appGroupUserId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
