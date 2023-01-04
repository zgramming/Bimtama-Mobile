import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LoginResponseModel extends Equatable {
  const LoginResponseModel({
    required this.success,
    required this.message,
    required this.data,
    required this.token,
  });

  final bool success;
  final dynamic message;
  final LoginData? data;
  final String? token;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data, token];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LoginData extends Equatable {
  const LoginData({
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

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);

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
