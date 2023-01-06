// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureProfileModel _$LectureProfileModelFromJson(Map<String, dynamic> json) =>
    LectureProfileModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : LectureProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LectureProfileModelToJson(
        LectureProfileModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LectureProfileData _$LectureProfileDataFromJson(Map<String, dynamic> json) =>
    LectureProfileData(
      id: json['id'] as int,
      appGroupUserId: json['app_group_user_id'] as int,
      username: json['username'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$LectureProfileDataToJson(LectureProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'app_group_user_id': instance.appGroupUserId,
      'username': instance.username,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
    };
