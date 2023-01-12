import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'mahasiswa_schedule_meeting_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaScheduleMeetingModel extends Equatable {
  const MahasiswaScheduleMeetingModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final List<MahasiswaScheduleMeetingData>? data;

  factory MahasiswaScheduleMeetingModel.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaScheduleMeetingModelFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaScheduleMeetingModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaScheduleMeetingData extends Equatable {
  const MahasiswaScheduleMeetingData({
    required this.id,
    required this.groupId,
    required this.title,
    this.description,
    required this.type,
    required this.method,
    this.linkMaps,
    this.linkMeeting,
    required this.startDate,
    this.endDate,
    required this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.group,
    this.meetingSchedulePersonal,
  });

  final int id;
  final int groupId;
  final String title;
  final String? description;
  final String type;
  final String method;
  final String? linkMaps;
  final String? linkMeeting;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int? createdBy;
  final dynamic updatedBy;
  final Group? group;
  final MeetingSchedulePersonal? meetingSchedulePersonal;
  factory MahasiswaScheduleMeetingData.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaScheduleMeetingDataFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaScheduleMeetingDataToJson(this);

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
      group,
      meetingSchedulePersonal,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class Group extends Equatable {
  const Group({
    this.id,
    this.name,
    this.code,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  final int? id;
  final String? name;
  final String? code;
  final String? description;
  final dynamic image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? createdBy;
  final dynamic updatedBy;
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      code,
      description,
      image,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MeetingSchedulePersonal extends Equatable {
  const MeetingSchedulePersonal({
    this.id,
    this.meetingScheduleId,
    this.groupId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  final String? id;
  final int? meetingScheduleId;
  final int? groupId;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
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
    ];
  }

  @override
  bool get stringify => true;
}
