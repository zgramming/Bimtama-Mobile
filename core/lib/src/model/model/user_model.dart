// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final int? appGroupUserId;
  final AppGroupUser appGroupUser;

  const UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.username,
    this.appGroupUserId,
    required this.appGroupUser,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  bool get stringify => true;

  UserData copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? username,
    int? appGroupUserId,
    AppGroupUser? appGroupUser,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      appGroupUserId: appGroupUserId ?? this.appGroupUserId,
      appGroupUser: appGroupUser ?? this.appGroupUser,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      phone,
      username,
      appGroupUserId,
      appGroupUser,
    ];
  }
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
