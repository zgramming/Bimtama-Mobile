import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'guidance_update_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GuidanceUpdateResponseModel extends Equatable {
  const GuidanceUpdateResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final dynamic message;
  final GuidanceUpdateResponseData? data;

  factory GuidanceUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GuidanceUpdateResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GuidanceUpdateResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GuidanceUpdateResponseData extends Equatable {
  const GuidanceUpdateResponseData({
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
    required this.createdBy,
    required this.updatedBy,
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

  factory GuidanceUpdateResponseData.fromJson(Map<String, dynamic> json) =>
      _$GuidanceUpdateResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$GuidanceUpdateResponseDataToJson(this);

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
