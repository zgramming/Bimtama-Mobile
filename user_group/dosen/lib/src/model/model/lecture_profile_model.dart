import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_profile_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureProfileModel extends Equatable {
  const LectureProfileModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final LectureProfileData? data;

  factory LectureProfileModel.fromJson(Map<String, dynamic> json) =>
      _$LectureProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$LectureProfileModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureProfileData extends Equatable {
  const LectureProfileData({
    required this.id,
    required this.appGroupUserId,
    required this.username,
    required this.name,
    required this.phone,
    required this.email,
  });

  final int id;
  final int appGroupUserId;
  final String username;
  final String name;
  final String? phone;
  final String? email;

  factory LectureProfileData.fromJson(Map<String, dynamic> json) =>
      _$LectureProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$LectureProfileDataToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      appGroupUserId,
      username,
      name,
      phone,
      email,
    ];
  }
}
