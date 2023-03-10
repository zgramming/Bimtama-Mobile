import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

import 'lecture_guidance_detail_outline_model.dart';

part 'lecture_guidance_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGuidanceDetailModel extends Equatable {
  const LectureGuidanceDetailModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final LectureGuidanceDetailData? data;

  factory LectureGuidanceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LectureGuidanceDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$LectureGuidanceDetailModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGuidanceDetailData extends Equatable {
  const LectureGuidanceDetailData({
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

  factory LectureGuidanceDetailData.fromJson(Map<String, dynamic> json) =>
      _$LectureGuidanceDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$LectureGuidanceDetailDataToJson(this);

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
    this.name,
  });

  final int? id;
  final String? name;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, name];

  @override
  bool get stringify => true;
}
