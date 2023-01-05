// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_update_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupUpdateResponseModel _$GroupUpdateResponseModelFromJson(
        Map<String, dynamic> json) =>
    GroupUpdateResponseModel(
      message: json['message'],
      success: json['success'] as bool,
    );

Map<String, dynamic> _$GroupUpdateResponseModelToJson(
        GroupUpdateResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
