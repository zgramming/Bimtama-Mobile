import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_guidance_master_outline_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGuidanceMasterOutlineModel extends Equatable {
  const LectureGuidanceMasterOutlineModel({
    required this.success,
    required this.message,
    this.data = const [],
  });

  final bool success;
  final String message;
  final List<LectureGuidanceMasterOutlineData> data;

  factory LectureGuidanceMasterOutlineModel.fromJson(
          Map<String, dynamic> json) =>
      _$LectureGuidanceMasterOutlineModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LectureGuidanceMasterOutlineModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureGuidanceMasterOutlineData extends Equatable {
  const LectureGuidanceMasterOutlineData({
    this.id,
    this.name,
    this.code,
    this.guidanceDetail,
  });

  final int? id;
  final String? name;
  final String? code;
  final List<GuidanceDetail?>? guidanceDetail;

  factory LectureGuidanceMasterOutlineData.fromJson(
          Map<String, dynamic> json) =>
      _$LectureGuidanceMasterOutlineDataFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LectureGuidanceMasterOutlineDataToJson(this);

  @override
  List<Object?> get props => [id, name, code, guidanceDetail];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GuidanceDetail extends Equatable {
  const GuidanceDetail({
    this.id,
    this.guidanceId,
    this.userId,
    this.groupId,
    this.title,
    this.user,
  });

  final String? id;
  final int? guidanceId;
  final int? userId;
  final int? groupId;
  final String? title;
  final User? user;

  factory GuidanceDetail.fromJson(Map<String, dynamic> json) =>
      _$GuidanceDetailFromJson(json);
  Map<String, dynamic> toJson() => _$GuidanceDetailToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      guidanceId,
      userId,
      groupId,
      title,
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
    this.name,
  });

  final String? name;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [name];

  @override
  bool get stringify => true;
}
