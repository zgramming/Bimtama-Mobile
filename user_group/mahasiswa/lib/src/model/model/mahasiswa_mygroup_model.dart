import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'mahasiswa_mygroup_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaMyGroupModel extends Equatable {
  const MahasiswaMyGroupModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final MahasiswaMyGroupData? data;

  factory MahasiswaMyGroupModel.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaMyGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaMyGroupModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaMyGroupData extends Equatable {
  const MahasiswaMyGroupData({
    this.id,
    this.name,
    this.code,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.groupMember,
  });

  final int? id;
  final String? name;
  final String? code;
  final String? description;
  final dynamic image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? createdBy;
  final dynamic updatedBy;
  final List<GroupMember?>? groupMember;

  factory MahasiswaMyGroupData.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaMyGroupDataFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaMyGroupDataToJson(this);

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
    this.id,
    this.groupId,
    this.userId,
    this.isAdmin,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.user,
  });

  final String? id;
  final int? groupId;
  final int? userId;
  final bool? isAdmin;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final User? user;

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
    this.id,
    this.appGroupUserId,
    this.name,
    this.email,
    this.username,
    this.phone,
  });

  final int? id;
  final int? appGroupUserId;
  final String? name;
  final String? email;
  final String? username;
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
      username,
      phone,
    ];
  }

  @override
  bool get stringify => true;
}
