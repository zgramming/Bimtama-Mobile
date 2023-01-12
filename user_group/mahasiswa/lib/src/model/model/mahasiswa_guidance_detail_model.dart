import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'mahasiswa_guidance_detail_model.g.dart';

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
class MahasiswaGuidanceDetailModel extends Equatable {
  const MahasiswaGuidanceDetailModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final List<MahasiswaGuidanceDetailData?>? data;

  factory MahasiswaGuidanceDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaGuidanceDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaGuidanceDetailModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaGuidanceDetailData extends Equatable {
  const MahasiswaGuidanceDetailData({
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
    required this.createdAt,
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
  final String? lectureNote;
  final GuidanceStatus status;
  final String? file;
  final String? fileLecture;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;

  factory MahasiswaGuidanceDetailData.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaGuidanceDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaGuidanceDetailDataToJson(this);

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
