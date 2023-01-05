import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
part 'group_create_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GroupCreateResponseModel extends Equatable {
  const GroupCreateResponseModel({
    required this.message,
    required this.success,
  });

  final dynamic message;
  final bool success;

  factory GroupCreateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GroupCreateResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GroupCreateResponseModelToJson(this);

  @override
  List<Object> get props => [message, success];

  @override
  bool get stringify => true;
}
