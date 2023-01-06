import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_schedule_meeting_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureScheduleMeetingModel extends Equatable {
  const LectureScheduleMeetingModel({
    required this.success,
    required this.message,
    this.data = const [],
  });

  final bool success;
  final String message;
  final List<LectureScheduleMeetingData> data;

  factory LectureScheduleMeetingModel.fromJson(Map<String, dynamic> json) =>
      _$LectureScheduleMeetingModelFromJson(json);
  Map<String, dynamic> toJson() => _$LectureScheduleMeetingModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [success, message, data];
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureScheduleMeetingData extends Equatable {
  const LectureScheduleMeetingData({
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
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
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
  final DateTime updatedAt;
  final int createdBy;
  final int? updatedBy;

  factory LectureScheduleMeetingData.fromJson(Map<String, dynamic> json) =>
      _$LectureScheduleMeetingDataFromJson(json);
  Map<String, dynamic> toJson() => _$LectureScheduleMeetingDataToJson(this);

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
    ];
  }

  @override
  bool get stringify => true;
}
