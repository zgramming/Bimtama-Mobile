import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'outline_upsert_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class OutlineUpsertResponseModel extends Equatable {
  const OutlineUpsertResponseModel({
    this.data,
    required this.success,
    required this.message,
  });

  final OutlineUpsertResponseData? data;
  final bool success;
  final dynamic message;

  factory OutlineUpsertResponseModel.fromJson(Map<String, dynamic> json) =>
      _$OutlineUpsertResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$OutlineUpsertResponseModelToJson(this);

  @override
  List<Object?> get props => [data, success, message];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class OutlineUpsertResponseData extends Equatable {
  const OutlineUpsertResponseData({
    this.id,
    this.userId,
    this.outlineId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  final int? id;
  final int? userId;
  final int? outlineId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;

  factory OutlineUpsertResponseData.fromJson(Map<String, dynamic> json) =>
      _$OutlineUpsertResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$OutlineUpsertResponseDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      outlineId,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
    ];
  }

  @override
  bool get stringify => true;
}
