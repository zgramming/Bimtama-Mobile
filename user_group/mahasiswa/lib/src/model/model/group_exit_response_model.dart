import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'group_exit_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GroupExitResponseModel extends Equatable {
  const GroupExitResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final dynamic message;
  final bool? data;

  factory GroupExitResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GroupExitResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GroupExitResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}
