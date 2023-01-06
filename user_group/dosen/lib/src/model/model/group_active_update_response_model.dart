import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'group_active_update_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GroupActiveUpdateResponseModel extends Equatable {
  const GroupActiveUpdateResponseModel({
    required this.message,
    required this.success,
    this.data,
  });

  final dynamic message;
  final bool success;
  final GroupActiveUpdateResponseData? data;

  factory GroupActiveUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GroupActiveUpdateResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GroupActiveUpdateResponseModelToJson(this);

  @override
  List<Object?> get props => [message, success, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GroupActiveUpdateResponseData extends Equatable {
  const GroupActiveUpdateResponseData({
    required this.id,
    required this.userId,
    required this.groupId,
    required this.createdAt,
    required this.updatedAt,
    this.createdBy,
    this.updatedBy,
    required this.group,
  });

  final int id;
  final int userId;
  final int groupId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? createdBy;
  final int? updatedBy;
  final Group group;

  factory GroupActiveUpdateResponseData.fromJson(Map<String, dynamic> json) =>
      _$GroupActiveUpdateResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$GroupActiveUpdateResponseDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      groupId,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
      group,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class Group extends Equatable {
  const Group({
    required this.id,
    required this.name,
    required this.code,
    this.description,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
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

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

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
