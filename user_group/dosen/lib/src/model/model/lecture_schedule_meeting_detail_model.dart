import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_schedule_meeting_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureScheduleMeetingDetailModel extends Equatable {
  const LectureScheduleMeetingDetailModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final LectureScheduleMeetingDetail? data;

  factory LectureScheduleMeetingDetailModel.fromJson(
          Map<String, dynamic> json) =>
      _$LectureScheduleMeetingDetailModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LectureScheduleMeetingDetailModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureScheduleMeetingDetail extends Equatable {
  const LectureScheduleMeetingDetail({
    required this.id,
    required this.groupId,
    required this.title,
    required this.description,
    required this.type,
    required this.method,
    this.linkMaps,
    this.linkMeeting,
    required this.startDate,
    this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
    this.meetingSchedulePersonal,
  });

  final int id;
  final int groupId;
  final String title;
  final String description;
  final String type;
  final String method;
  final String? linkMaps;
  final String? linkMeeting;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int createdBy;
  final int? updatedBy;
  final MeetingSchedulePersonal? meetingSchedulePersonal;

  factory LectureScheduleMeetingDetail.fromJson(Map<String, dynamic> json) =>
      _$LectureScheduleMeetingDetailFromJson(json);
  Map<String, dynamic> toJson() => _$LectureScheduleMeetingDetailToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      groupId,
      title,
      description,
      type,
      method,
      linkMaps,
      linkMeeting,
      startDate,
      endDate,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
      meetingSchedulePersonal,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MeetingSchedulePersonal extends Equatable {
  const MeetingSchedulePersonal({
    required this.id,
    required this.meetingScheduleId,
    required this.groupId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.user,
  });

  final String id;
  final int meetingScheduleId;
  final int groupId;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? createdBy;
  final int? updatedBy;
  final User? user;

  factory MeetingSchedulePersonal.fromJson(Map<String, dynamic> json) =>
      _$MeetingSchedulePersonalFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingSchedulePersonalToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      meetingScheduleId,
      groupId,
      userId,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
      user,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class User extends Equatable {
  const User({
    required this.name,
  });

  final String name;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [name];

  @override
  bool get stringify => true;
}
