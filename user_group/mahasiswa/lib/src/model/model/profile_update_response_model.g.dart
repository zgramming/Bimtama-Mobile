// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_update_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileUpdateResponseModel _$ProfileUpdateResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileUpdateResponseModel(
      success: json['success'] as bool,
      data: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'],
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ProfileUpdateResponseModelToJson(
        ProfileUpdateResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
      'token': instance.token,
    };
