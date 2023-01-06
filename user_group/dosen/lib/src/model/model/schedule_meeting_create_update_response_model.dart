import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'schedule_meeting_create_update_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class ScheduleMeetingCreateUpdateResponseModel extends Equatable {
  const ScheduleMeetingCreateUpdateResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final dynamic message;
  final ScheduleMeetingCreateUpdateResponseData? data;

  factory ScheduleMeetingCreateUpdateResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$ScheduleMeetingCreateUpdateResponseModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ScheduleMeetingCreateUpdateResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class ScheduleMeetingCreateUpdateResponseData extends Equatable {
  const ScheduleMeetingCreateUpdateResponseData({
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

  factory ScheduleMeetingCreateUpdateResponseData.fromJson(
          Map<String, dynamic> json) =>
      _$ScheduleMeetingCreateUpdateResponseDataFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ScheduleMeetingCreateUpdateResponseDataToJson(this);

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
