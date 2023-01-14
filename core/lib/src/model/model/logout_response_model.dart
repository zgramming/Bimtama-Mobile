import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'logout_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class LogoutResponseModel extends Equatable {
  const LogoutResponseModel({
    required this.success,
    required this.message,
  });

  final bool success;
  final dynamic message;

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LogoutResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message];

  @override
  bool get stringify => true;
}
