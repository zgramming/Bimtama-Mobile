import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_active_group_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureActiveGroupModel extends Equatable {
  const LectureActiveGroupModel({
    required this.success,
    this.message,
    this.data,
  });

  final bool success;
  final String? message;
  final LectureActiveGroupData? data;

  factory LectureActiveGroupModel.fromJson(Map<String, dynamic> json) =>
      _$LectureActiveGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$LectureActiveGroupModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureActiveGroupData extends Equatable {
  const LectureActiveGroupData({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
  });

  final int id;
  final String name;
  final String code;
  final String description;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int createdBy;
  final int? updatedBy;

  factory LectureActiveGroupData.fromJson(Map<String, dynamic> json) =>
      _$LectureActiveGroupDataFromJson(json);
  Map<String, dynamic> toJson() => _$LectureActiveGroupDataToJson(this);

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
