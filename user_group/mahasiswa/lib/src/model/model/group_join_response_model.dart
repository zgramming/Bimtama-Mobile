import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'group_join_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GroupJoinResponseModel extends Equatable {
  const GroupJoinResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final dynamic message;
  final GroupJoinResponseData? data;

  factory GroupJoinResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GroupJoinResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GroupJoinResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GroupJoinResponseData extends Equatable {
  const GroupJoinResponseData({
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

  factory GroupJoinResponseData.fromJson(Map<String, dynamic> json) =>
      _$GroupJoinResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$GroupJoinResponseDataToJson(this);

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
