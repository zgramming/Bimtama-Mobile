// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_guidance_master_outline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureGuidanceMasterOutlineModel _$LectureGuidanceMasterOutlineModelFromJson(
        Map<String, dynamic> json) =>
    LectureGuidanceMasterOutlineModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => LectureGuidanceMasterOutlineData.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LectureGuidanceMasterOutlineModelToJson(
        LectureGuidanceMasterOutlineModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LectureGuidanceMasterOutlineData _$LectureGuidanceMasterOutlineDataFromJson(
        Map<String, dynamic> json) =>
    LectureGuidanceMasterOutlineData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      guidanceDetail: (json['guidance_detail'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GuidanceDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LectureGuidanceMasterOutlineDataToJson(
        LectureGuidanceMasterOutlineData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'guidance_detail': instance.guidanceDetail,
    };

GuidanceDetail _$GuidanceDetailFromJson(Map<String, dynamic> json) =>
    GuidanceDetail(
      id: json['id'] as String?,
      guidanceId: json['guidance_id'] as int?,
      userId: json['user_id'] as int?,
      groupId: json['group_id'] as int?,
      title: json['title'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GuidanceDetailToJson(GuidanceDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guidance_id': instance.guidanceId,
      'user_id': instance.userId,
      'group_id': instance.groupId,
      'title': instance.title,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
    };
