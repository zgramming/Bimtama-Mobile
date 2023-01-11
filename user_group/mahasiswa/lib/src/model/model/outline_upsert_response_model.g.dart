// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outline_upsert_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutlineUpsertResponseModel _$OutlineUpsertResponseModelFromJson(
        Map<String, dynamic> json) =>
    OutlineUpsertResponseModel(
      data: json['data'] == null
          ? null
          : OutlineUpsertResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
      success: json['success'] as bool,
      message: json['message'],
    );

Map<String, dynamic> _$OutlineUpsertResponseModelToJson(
        OutlineUpsertResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

OutlineUpsertResponseData _$OutlineUpsertResponseDataFromJson(
        Map<String, dynamic> json) =>
    OutlineUpsertResponseData(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      outlineId: json['outline_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$OutlineUpsertResponseDataToJson(
        OutlineUpsertResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'outline_id': instance.outlineId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
