// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_schedule_meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureScheduleMeetingModel _$LectureScheduleMeetingModelFromJson(
        Map<String, dynamic> json) =>
    LectureScheduleMeetingModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => LectureScheduleMeetingData.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LectureScheduleMeetingModelToJson(
        LectureScheduleMeetingModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LectureScheduleMeetingData _$LectureScheduleMeetingDataFromJson(
        Map<String, dynamic> json) =>
    LectureScheduleMeetingData(
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
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int?,
    );

Map<String, dynamic> _$LectureScheduleMeetingDataToJson(
        LectureScheduleMeetingData instance) =>
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
    };
