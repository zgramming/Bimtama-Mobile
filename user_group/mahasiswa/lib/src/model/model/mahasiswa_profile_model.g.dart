// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaProfileModel _$MahasiswaProfileModelFromJson(
        Map<String, dynamic> json) =>
    MahasiswaProfileModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : MahasiswaProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MahasiswaProfileModelToJson(
        MahasiswaProfileModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MahasiswaProfileData _$MahasiswaProfileDataFromJson(
        Map<String, dynamic> json) =>
    MahasiswaProfileData(
      id: json['id'] as int?,
      appGroupUserId: json['app_group_user_id'] as int?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$MahasiswaProfileDataToJson(
        MahasiswaProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'app_group_user_id': instance.appGroupUserId,
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
    };
