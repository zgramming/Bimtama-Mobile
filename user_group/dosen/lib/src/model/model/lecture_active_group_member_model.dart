import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_active_group_member_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureActiveGroupMemberModel extends Equatable {
  const LectureActiveGroupMemberModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final List<LectureActiveGroupMemberData>? data;

  factory LectureActiveGroupMemberModel.fromJson(Map<String, dynamic> json) =>
      _$LectureActiveGroupMemberModelFromJson(json);
  Map<String, dynamic> toJson() => _$LectureActiveGroupMemberModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureActiveGroupMemberData extends Equatable {
  const LectureActiveGroupMemberData({
    required this.id,
    required this.groupId,
    required this.userId,
    required this.isAdmin,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.user,
  });
  final String id;
  final int groupId;
  final int userId;
  final bool isAdmin;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? createdBy;
  final int? updatedBy;
  final User? user;

  factory LectureActiveGroupMemberData.fromJson(Map<String, dynamic> json) =>
      _$LectureActiveGroupMemberDataFromJson(json);
  Map<String, dynamic> toJson() => _$LectureActiveGroupMemberDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      groupId,
      userId,
      isAdmin,
      isActive,
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
    required this.id,
    required this.appGroupUserId,
    required this.name,
    required this.email,
    required this.phone,
  });

  final int id;
  final int appGroupUserId;
  final String? name;
  final String? email;
  final String? phone;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      appGroupUserId,
      name,
      email,
      phone,
    ];
  }

  @override
  bool get stringify => true;
}
