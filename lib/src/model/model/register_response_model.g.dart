// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseModel _$RegisterResponseModelFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseModel(
      success: json['success'] as bool,
      message: json['message'],
      data: json['data'] == null
          ? null
          : RegisterData.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RegisterResponseModelToJson(
        RegisterResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'token': instance.token,
    };

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData(
      id: json['id'] as int,
      appGroupUserId: json['app_group_user_id'] as int,
      name: json['name'] as String,
      email: json['email'] as String?,
      username: json['username'] as String,
      password: json['password'] as String,
      status: json['status'] as String,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
    );

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'app_group_user_id': instance.appGroupUserId,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'status': instance.status,
      'phone': instance.phone,
      'image': instance.image,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
