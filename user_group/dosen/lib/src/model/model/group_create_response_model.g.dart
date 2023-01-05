// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_create_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupCreateResponseModel _$GroupCreateResponseModelFromJson(
        Map<String, dynamic> json) =>
    GroupCreateResponseModel(
      message: json['message'],
      success: json['success'] as bool,
    );

Map<String, dynamic> _$GroupCreateResponseModelToJson(
        GroupCreateResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
