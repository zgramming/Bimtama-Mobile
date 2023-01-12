import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'mahasiswa_guidance_progress_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaGuidanceProgressModel extends Equatable {
  const MahasiswaGuidanceProgressModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final List<MahasiswaGuidanceProgressData?>? data;

  factory MahasiswaGuidanceProgressModel.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaGuidanceProgressModelFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaGuidanceProgressModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaGuidanceProgressData extends Equatable {
  const MahasiswaGuidanceProgressData({
    this.id,
    this.guidanceId,
    this.userId,
    this.mstOutlineComponentId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  final int? id;
  final int? guidanceId;
  final int? userId;
  final int? mstOutlineComponentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;

  factory MahasiswaGuidanceProgressData.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaGuidanceProgressDataFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaGuidanceProgressDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      guidanceId,
      userId,
      mstOutlineComponentId,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
    ];
  }

  @override
  bool get stringify => true;
}
