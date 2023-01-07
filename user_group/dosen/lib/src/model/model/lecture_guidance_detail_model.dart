import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_guidance_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGuidanceDetailDetailModel extends Equatable {
  const LectureGuidanceDetailDetailModel({
    required this.success,
    required this.message,
    this.data = const [],
  });

  final bool success;
  final String message;
  final List<LectureGuidanceDetailDetailData> data;

  factory LectureGuidanceDetailDetailModel.fromJson(
          Map<String, dynamic> json) =>
      _$LectureGuidanceDetailDetailModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LectureGuidanceDetailDetailModelToJson(this);

  @override
  List<Object> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGuidanceDetailDetailData extends Equatable {
  const LectureGuidanceDetailDetailData({
    this.id,
    this.guidanceId,
    this.userId,
    this.groupId,
    this.mstOutlineComponentId,
    this.title,
    this.description,
    this.lectureNote,
    this.status,
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
  final String? status;
  final String? file;
  final String? fileLecture;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? createdBy;
  final int? updatedBy;
  final User? user;

  factory LectureGuidanceDetailDetailData.fromJson(Map<String, dynamic> json) =>
      _$LectureGuidanceDetailDetailDataFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LectureGuidanceDetailDetailDataToJson(this);

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
