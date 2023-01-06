// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_schedule_meeting_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureScheduleMeetingDetailModel _$LectureScheduleMeetingDetailModelFromJson(
        Map<String, dynamic> json) =>
    LectureScheduleMeetingDetailModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : LectureScheduleMeetingDetail.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LectureScheduleMeetingDetailModelToJson(
        LectureScheduleMeetingDetailModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LectureScheduleMeetingDetail _$LectureScheduleMeetingDetailFromJson(
        Map<String, dynamic> json) =>
    LectureScheduleMeetingDetail(
      id: json['id'] as int,
      groupId: json['group_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      method: json['method'] as String,
      linkMaps: json['link_maps'] as String?,
      linkMeeting: json['link_meeting'] as String?,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int?,
      meetingSchedulePersonal: json['meeting_schedule_personal'] == null
          ? null
          : MeetingSchedulePersonal.fromJson(
              json['meeting_schedule_personal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LectureScheduleMeetingDetailToJson(
        LectureScheduleMeetingDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_id': instance.groupId,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'method': instance.method,
      'link_maps': instance.linkMaps,
      'link_meeting': instance.linkMeeting,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'meeting_schedule_personal': instance.meetingSchedulePersonal,
    };

MeetingSchedulePersonal _$MeetingSchedulePersonalFromJson(
        Map<String, dynamic> json) =>
    MeetingSchedulePersonal(
      id: json['id'] as String,
      meetingScheduleId: json['meeting_schedule_id'] as int,
      groupId: json['group_id'] as int,
      userId: json['user_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeetingSchedulePersonalToJson(
        MeetingSchedulePersonal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meeting_schedule_id': instance.meetingScheduleId,
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
    };
