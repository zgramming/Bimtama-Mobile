// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa_schedule_meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaScheduleMeetingModel _$MahasiswaScheduleMeetingModelFromJson(
        Map<String, dynamic> json) =>
    MahasiswaScheduleMeetingModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              MahasiswaScheduleMeetingData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MahasiswaScheduleMeetingModelToJson(
        MahasiswaScheduleMeetingModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MahasiswaScheduleMeetingData _$MahasiswaScheduleMeetingDataFromJson(
        Map<String, dynamic> json) =>
    MahasiswaScheduleMeetingData(
      id: json['id'] as int,
      groupId: json['group_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      type: json['type'] as String,
      method: json['method'] as String,
      linkMaps: json['link_maps'] as String?,
      linkMeeting: json['link_meeting'] as String?,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'],
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
      meetingSchedulePersonal: json['meeting_schedule_personal'] == null
          ? null
          : MeetingSchedulePersonal.fromJson(
              json['meeting_schedule_personal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MahasiswaScheduleMeetingDataToJson(
        MahasiswaScheduleMeetingData instance) =>
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
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'group': instance.group,
      'meeting_schedule_personal': instance.meetingSchedulePersonal,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      image: json['image'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int?,
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'image': instance.image,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

MeetingSchedulePersonal _$MeetingSchedulePersonalFromJson(
        Map<String, dynamic> json) =>
    MeetingSchedulePersonal(
      id: json['id'] as String?,
      meetingScheduleId: json['meeting_schedule_id'] as int?,
      groupId: json['group_id'] as int?,
      userId: json['user_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$MeetingSchedulePersonalToJson(
        MeetingSchedulePersonal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meeting_schedule_id': instance.meetingScheduleId,
      'group_id': instance.groupId,
      'user_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
