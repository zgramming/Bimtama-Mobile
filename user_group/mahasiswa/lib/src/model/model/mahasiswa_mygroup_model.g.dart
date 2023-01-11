// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa_mygroup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaMyGroupModel _$MahasiswaMyGroupModelFromJson(
        Map<String, dynamic> json) =>
    MahasiswaMyGroupModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : MahasiswaMyGroupData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MahasiswaMyGroupModelToJson(
        MahasiswaMyGroupModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MahasiswaMyGroupData _$MahasiswaMyGroupDataFromJson(
        Map<String, dynamic> json) =>
    MahasiswaMyGroupData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      image: json['image'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'],
      groupMember: (json['group_member'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GroupMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MahasiswaMyGroupDataToJson(
        MahasiswaMyGroupData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'image': instance.image,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'group_member': instance.groupMember,
    };

GroupMember _$GroupMemberFromJson(Map<String, dynamic> json) => GroupMember(
      id: json['id'] as String?,
      groupId: json['group_id'] as int?,
      userId: json['user_id'] as int?,
      isAdmin: json['is_admin'] as bool?,
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupMemberToJson(GroupMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'is_admin': instance.isAdmin,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      appGroupUserId: json['app_group_user_id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'app_group_user_id': instance.appGroupUserId,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'phone': instance.phone,
    };
