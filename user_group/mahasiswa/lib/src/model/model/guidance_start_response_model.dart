import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'guidance_start_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GuidanceStartResponseModel extends Equatable {
  const GuidanceStartResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final dynamic message;
  final GuidanceStartResponseData? data;

  factory GuidanceStartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GuidanceStartResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GuidanceStartResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class GuidanceStartResponseData extends Equatable {
  const GuidanceStartResponseData({
    this.id,
    this.userId,
    this.groupId,
    this.currentProgresMstOutlineComponentId,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  final int? id;
  final int? userId;
  final int? groupId;
  final int? currentProgresMstOutlineComponentId;
  final String? title;
  final dynamic description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;

  factory GuidanceStartResponseData.fromJson(Map<String, dynamic> json) =>
      _$GuidanceStartResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$GuidanceStartResponseDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      groupId,
      currentProgresMstOutlineComponentId,
      title,
      description,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
    ];
  }

  @override
  bool get stringify => true;
}
