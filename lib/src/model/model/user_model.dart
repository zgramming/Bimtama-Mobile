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
  const UserData({
    required this.id,
    required this.appGroupUserId,
    required this.name,
    this.email,
    required this.username,
    required this.password,
    required this.status,
    this.phone,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  final int id;
  final int appGroupUserId;
  final String name;
  final String? email;
  final String username;
  final String password;
  final String status;
  final String? phone;
  final String? image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? createdBy;
  final int? updatedBy;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      appGroupUserId,
      name,
      email,
      username,
      password,
      status,
      phone,
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
