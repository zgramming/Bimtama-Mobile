import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'searched_group_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class SearchedGroupModel extends Equatable {
  const SearchedGroupModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final SearchedGroupData? data;
  factory SearchedGroupModel.fromJson(Map<String, dynamic> json) =>
      _$SearchedGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$SearchedGroupModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class SearchedGroupData extends Equatable {
  const SearchedGroupData({
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
  final List<SearchedGroupMember?>? groupMember;

  factory SearchedGroupData.fromJson(Map<String, dynamic> json) =>
      _$SearchedGroupDataFromJson(json);
  Map<String, dynamic> toJson() => _$SearchedGroupDataToJson(this);
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
class SearchedGroupMember extends Equatable {
  const SearchedGroupMember({
    this.id,
    this.groupId,
    this.userId,
    this.isAdmin,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
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

  factory SearchedGroupMember.fromJson(Map<String, dynamic> json) =>
      _$SearchedGroupMemberFromJson(json);
  Map<String, dynamic> toJson() => _$SearchedGroupMemberToJson(this);

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
