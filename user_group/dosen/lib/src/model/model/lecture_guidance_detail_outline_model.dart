import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_guidance_detail_outline_model.g.dart';

enum GuidanceStatus {
  @JsonValue("approved")
  approved,
  @JsonValue("rejected")
  rejected,
  @JsonValue("progress")
  progress
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGuidanceDetailDetailOutlineModel extends Equatable {
  const LectureGuidanceDetailDetailOutlineModel({
    required this.success,
    required this.message,
    this.data = const [],
  });

  final bool success;
  final String message;
  final List<LectureGuidanceDetailDetailOutlineData> data;

  factory LectureGuidanceDetailDetailOutlineModel.fromJson(
          Map<String, dynamic> json) =>
      _$LectureGuidanceDetailDetailOutlineModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LectureGuidanceDetailDetailOutlineModelToJson(this);

  @override
  List<Object> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGuidanceDetailDetailOutlineData extends Equatable {
  const LectureGuidanceDetailDetailOutlineData({
    this.id,
    this.guidanceId,
    this.userId,
    this.groupId,
    this.mstOutlineComponentId,
    this.title,
    this.description,
    this.lectureNote,
    this.status = GuidanceStatus.progress,
    this.file,
    this.fileLecture,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.user,
  });

  final String? id;
  final int? guidanceId;
  final int? userId;
  final int? groupId;
  final int? mstOutlineComponentId;
  final String? title;
  final String? description;
  final String? lectureNote;
  final GuidanceStatus status;
  final String? file;
  final String? fileLecture;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? createdBy;
  final int? updatedBy;
  final User? user;

  factory LectureGuidanceDetailDetailOutlineData.fromJson(
          Map<String, dynamic> json) =>
      _$LectureGuidanceDetailDetailOutlineDataFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LectureGuidanceDetailDetailOutlineDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      guidanceId,
      userId,
      groupId,
      mstOutlineComponentId,
      title,
      description,
      lectureNote,
      status,
      file,
      fileLecture,
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
    this.id,
    this.appGroupUserId,
    this.name,
  });

  final int? id;
  final int? appGroupUserId;
  final String? name;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, appGroupUserId, name];

  @override
  bool get stringify => true;
}
