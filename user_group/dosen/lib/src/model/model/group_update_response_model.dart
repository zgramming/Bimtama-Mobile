import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
part 'group_update_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GroupUpdateResponseModel extends Equatable {
  const GroupUpdateResponseModel({
    required this.message,
    required this.success,
  });

  final dynamic message;
  final bool success;

  factory GroupUpdateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GroupUpdateResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GroupUpdateResponseModelToJson(this);

  @override
  List<Object> get props => [message, success];

  @override
  bool get stringify => true;
}
