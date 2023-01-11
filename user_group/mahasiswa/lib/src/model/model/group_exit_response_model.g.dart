// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_exit_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupExitResponseModel _$GroupExitResponseModelFromJson(
        Map<String, dynamic> json) =>
    GroupExitResponseModel(
      success: json['success'] as bool,
      message: json['message'],
      data: json['data'] as int?,
    );

Map<String, dynamic> _$GroupExitResponseModelToJson(
        GroupExitResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
