import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

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
  final UserData? data;
  final String? token;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data, token];

  @override
  bool get stringify => true;
}
