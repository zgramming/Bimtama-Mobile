// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_join_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupJoinResponseModel _$GroupJoinResponseModelFromJson(
        Map<String, dynamic> json) =>
    GroupJoinResponseModel(
      success: json['success'] as bool,
      message: json['message'],
      data: json['data'] == null
          ? null
          : GroupJoinResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GroupJoinResponseModelToJson(
        GroupJoinResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

GroupJoinResponseData _$GroupJoinResponseDataFromJson(
        Map<String, dynamic> json) =>
    GroupJoinResponseData(
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

Map<String, dynamic> _$GroupJoinResponseDataToJson(
        GroupJoinResponseData instance) =>
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
