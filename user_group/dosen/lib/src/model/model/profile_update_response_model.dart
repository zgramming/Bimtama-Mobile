import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'profile_update_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class ProfileUpdateResponseModel extends Equatable {
  const ProfileUpdateResponseModel({
    required this.success,
    this.data,
    required this.message,
    this.token,
  });

  final bool success;
  final UserData? data;
  final dynamic message;
  final String? token;

  factory ProfileUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileUpdateResponseModelToJson(this);

  @override
  List<Object?> get props => [success, data, message, token];

  @override
  bool get stringify => true;
}
