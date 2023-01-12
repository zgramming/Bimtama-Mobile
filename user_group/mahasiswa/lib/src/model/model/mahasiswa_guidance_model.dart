import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'mahasiswa_guidance_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaGuidanceModel extends Equatable {
  const MahasiswaGuidanceModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final MahasiswaGuidanceData? data;

  factory MahasiswaGuidanceModel.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaGuidanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaGuidanceModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaGuidanceData extends Equatable {
  const MahasiswaGuidanceData({
    this.id,
    this.userId,
    this.groupId,
    this.currentProgresMstOutlineComponentId,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  final int? id;
  final int? userId;
  final int? groupId;
  final int? currentProgresMstOutlineComponentId;
  final String? title;
  final dynamic description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;

  factory MahasiswaGuidanceData.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaGuidanceDataFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaGuidanceDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      groupId,
      currentProgresMstOutlineComponentId,
      title,
      description,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
    ];
  }

  @override
  bool get stringify => true;
}
