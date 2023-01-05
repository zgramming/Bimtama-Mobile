import 'package:bimtama/src/model/model/user_model.dart';
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
  final UserData? data;
  final String? token;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data, token];

  @override
  bool get stringify => true;
}
