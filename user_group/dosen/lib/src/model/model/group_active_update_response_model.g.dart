// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_active_update_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupActiveUpdateResponseModel _$GroupActiveUpdateResponseModelFromJson(
        Map<String, dynamic> json) =>
    GroupActiveUpdateResponseModel(
      message: json['message'],
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : GroupActiveUpdateResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupActiveUpdateResponseModelToJson(
        GroupActiveUpdateResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'data': instance.data,
    };

GroupActiveUpdateResponseData _$GroupActiveUpdateResponseDataFromJson(
        Map<String, dynamic> json) =>
    GroupActiveUpdateResponseData(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      groupId: json['group_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupActiveUpdateResponseDataToJson(
        GroupActiveUpdateResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'group_id': instance.groupId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'group': instance.group,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int?,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
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
