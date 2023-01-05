import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'lecture_active_group_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureActiveGroupDetailModel extends Equatable {
  const LectureActiveGroupDetailModel({
    required this.success,
    required this.data,
  });

  final bool success;
  final LectureActiveGroupDetailData? data;

  factory LectureActiveGroupDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LectureActiveGroupDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$LectureActiveGroupDetailModelToJson(this);

  @override
  List<Object?> get props => [success, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LectureActiveGroupDetailData extends Equatable {
  const LectureActiveGroupDetailData({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
    required this.groupMember,
  });

  final int id;
  final String name;
  final String code;
  final String? description;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int createdBy;
  final int? updatedBy;
  final List<GroupMember> groupMember;

  factory LectureActiveGroupDetailData.fromJson(Map<String, dynamic> json) =>
      _$LectureActiveGroupDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$LectureActiveGroupDetailDataToJson(this);

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
      groupMember,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GroupMember extends Equatable {
  const GroupMember({
    required this.id,
    required this.groupId,
    required this.userId,
    required this.isAdmin,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.createdBy,
    this.updatedBy,
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

  factory GroupMember.fromJson(Map<String, dynamic> json) =>
      _$GroupMemberFromJson(json);
  Map<String, dynamic> toJson() => _$GroupMemberToJson(this);

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
    ];
  }

  @override
  bool get stringify => true;
}
