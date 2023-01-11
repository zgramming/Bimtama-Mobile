// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedGroupModel _$SearchedGroupModelFromJson(Map<String, dynamic> json) =>
    SearchedGroupModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : SearchedGroupData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchedGroupModelToJson(SearchedGroupModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

SearchedGroupData _$SearchedGroupDataFromJson(Map<String, dynamic> json) =>
    SearchedGroupData(
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
              : SearchedGroupMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchedGroupDataToJson(SearchedGroupData instance) =>
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

SearchedGroupMember _$SearchedGroupMemberFromJson(Map<String, dynamic> json) =>
    SearchedGroupMember(
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
    );

Map<String, dynamic> _$SearchedGroupMemberToJson(
        SearchedGroupMember instance) =>
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
    };
