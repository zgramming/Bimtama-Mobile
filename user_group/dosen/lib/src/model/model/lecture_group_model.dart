import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_group_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGroupModel extends Equatable {
  const LectureGroupModel({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool success;
  final List<LectureGroupData>? data;
  final String message;

  factory LectureGroupModel.fromJson(Map<String, dynamic> json) =>
      _$LectureGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$LectureGroupModelToJson(this);

  @override
  List<Object?> get props => [success, data, message];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGroupData extends Equatable {
  const LectureGroupData({
    required this.id,
    required this.name,
    required this.code,
    this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String name;
  final String code;
  final String? description;
  final dynamic image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int createdBy;
  final int? updatedBy;

  factory LectureGroupData.fromJson(Map<String, dynamic> json) =>
      _$LectureGroupDataFromJson(json);
  Map<String, dynamic> toJson() => _$LectureGroupDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      code,
      description,
      image,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
    ];
  }

  @override
  bool get stringify => true;
}
