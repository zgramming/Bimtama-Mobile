import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'guidance_submission_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GuidanceSubmissionResponseModel extends Equatable {
  const GuidanceSubmissionResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final dynamic message;
  final GuidanceSubmissionResponseData? data;

  factory GuidanceSubmissionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GuidanceSubmissionResponseModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GuidanceSubmissionResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GuidanceSubmissionResponseData extends Equatable {
  const GuidanceSubmissionResponseData({
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
  });

  final String? id;
  final int? guidanceId;
  final int? userId;
  final int? groupId;
  final int? mstOutlineComponentId;
  final String? title;
  final String? description;
  final dynamic lectureNote;
  final String? status;
  final String? file;
  final dynamic fileLecture;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;

  factory GuidanceSubmissionResponseData.fromJson(Map<String, dynamic> json) =>
      _$GuidanceSubmissionResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$GuidanceSubmissionResponseDataToJson(this);

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
    ];
  }

  @override
  bool get stringify => true;
}
