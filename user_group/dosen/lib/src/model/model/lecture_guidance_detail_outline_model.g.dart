// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_guidance_detail_outline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureGuidanceDetailDetailOutlineModel
    _$LectureGuidanceDetailDetailOutlineModelFromJson(
            Map<String, dynamic> json) =>
        LectureGuidanceDetailDetailOutlineModel(
          success: json['success'] as bool,
          message: json['message'] as String,
          data: (json['data'] as List<dynamic>?)
                  ?.map((e) => LectureGuidanceDetailDetailOutlineData.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$LectureGuidanceDetailDetailOutlineModelToJson(
        LectureGuidanceDetailDetailOutlineModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LectureGuidanceDetailDetailOutlineData
    _$LectureGuidanceDetailDetailOutlineDataFromJson(
            Map<String, dynamic> json) =>
        LectureGuidanceDetailDetailOutlineData(
          id: json['id'] as String?,
          guidanceId: json['guidance_id'] as int?,
          userId: json['user_id'] as int?,
          groupId: json['group_id'] as int?,
          mstOutlineComponentId: json['mst_outline_component_id'] as int?,
          title: json['title'] as String?,
          description: json['description'] as String?,
          lectureNote: json['lecture_note'] as String?,
          status:
              $enumDecodeNullable(_$GuidanceStatusEnumMap, json['status']) ??
                  GuidanceStatus.progress,
          file: json['file'] as String?,
          fileLecture: json['file_lecture'] as String?,
          createdAt: json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
          updatedAt: json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
          createdBy: json['created_by'] as int?,
          updatedBy: json['updated_by'] as int?,
          user: json['user'] == null
              ? null
              : User.fromJson(json['user'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$LectureGuidanceDetailDetailOutlineDataToJson(
        LectureGuidanceDetailDetailOutlineData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'guidance_id': instance.guidanceId,
      'user_id': instance.userId,
      'group_id': instance.groupId,
      'mst_outline_component_id': instance.mstOutlineComponentId,
      'title': instance.title,
      'description': instance.description,
      'lecture_note': instance.lectureNote,
      'status': _$GuidanceStatusEnumMap[instance.status]!,
      'file': instance.file,
      'file_lecture': instance.fileLecture,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'user': instance.user,
    };

const _$GuidanceStatusEnumMap = {
  GuidanceStatus.approved: 'approved',
  GuidanceStatus.rejected: 'rejected',
  GuidanceStatus.progress: 'progress',
};

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      appGroupUserId: json['app_group_user_id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'app_group_user_id': instance.appGroupUserId,
      'name': instance.name,
    };
