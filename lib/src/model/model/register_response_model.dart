import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class RegisterResponseModel extends Equatable {
  const RegisterResponseModel({
    required this.success,
    required this.message,
    required this.data,
    required this.token,
  });

  final bool success;
  final dynamic message;
  final RegisterData? data;
  final String? token;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data, token];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class RegisterData extends Equatable {
  const RegisterData({
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

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDataToJson(this);

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
