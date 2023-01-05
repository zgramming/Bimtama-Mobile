import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class UserModel extends Equatable {
  const UserModel({
    required this.data,
    required this.token,
  });

  final UserData data;
  final String token;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object> get props => [data, token];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class UserData extends Equatable {
  final int id;
  final String? name;
  final String? email;
  final String? phone;
  final String? username;
  final AppGroupUser appGroupUser;

  const UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    required this.appGroupUser,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      username,
      appGroupUser,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class AppGroupUser extends Equatable {
  const AppGroupUser({
    required this.id,
    required this.code,
    required this.name,
  });

  final int id;
  final String code;
  final String name;

  factory AppGroupUser.fromJson(Map<String, dynamic> json) =>
      _$AppGroupUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppGroupUserToJson(this);

  @override
  List<Object> get props => [id, code, name];

  @override
  bool get stringify => true;
}
