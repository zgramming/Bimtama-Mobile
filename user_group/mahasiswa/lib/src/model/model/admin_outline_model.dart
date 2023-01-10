import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'admin_outline_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class AdminOutlineModel extends Equatable {
  const AdminOutlineModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final List<AdminOutlineData?>? data;

  factory AdminOutlineModel.fromJson(Map<String, dynamic> json) =>
      _$AdminOutlineModelFromJson(json);
  Map<String, dynamic> toJson() => _$AdminOutlineModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class AdminOutlineData extends Equatable {
  const AdminOutlineData({
    this.id,
    this.mstOutlineId,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.masterOutline,
    this.outlineComponent,
  });

  final int? id;
  final int? mstOutlineId;
  final String? title;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final MasterOutline? masterOutline;
  final List<OutlineComponent?>? outlineComponent;

  factory AdminOutlineData.fromJson(Map<String, dynamic> json) =>
      _$AdminOutlineDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdminOutlineDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      mstOutlineId,
      title,
      description,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
      masterOutline,
      outlineComponent,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MasterOutline extends Equatable {
  const MasterOutline({
    this.id,
    this.masterDataId,
    this.masterCategoryId,
    this.masterCategoryCode,
    this.code,
    this.name,
    this.order,
    this.description,
    this.status,
    this.parameter1Key,
    this.parameter1Value,
    this.parameter2Key,
    this.parameter2Value,
    this.parameter3Key,
    this.parameter3Value,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  final int? id;
  final dynamic masterDataId;
  final int? masterCategoryId;
  final String? masterCategoryCode;
  final String? code;
  final String? name;
  final int? order;
  final dynamic description;
  final String? status;
  final dynamic parameter1Key;
  final dynamic parameter1Value;
  final dynamic parameter2Key;
  final dynamic parameter2Value;
  final dynamic parameter3Key;
  final dynamic parameter3Value;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;

  factory MasterOutline.fromJson(Map<String, dynamic> json) =>
      _$MasterOutlineFromJson(json);
  Map<String, dynamic> toJson() => _$MasterOutlineToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      masterDataId,
      masterCategoryId,
      masterCategoryCode,
      code,
      name,
      order,
      description,
      status,
      parameter1Key,
      parameter1Value,
      parameter2Key,
      parameter2Value,
      parameter3Key,
      parameter3Value,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class OutlineComponent extends Equatable {
  const OutlineComponent({
    this.id,
    this.outlineId,
    this.mstOutlineComponentId,
    this.title,
    this.description,
    this.order,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.masterOutlineComponent,
  });

  final String? id;
  final int? outlineId;
  final int? mstOutlineComponentId;
  final String? title;
  final dynamic description;
  final int? order;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final MasterOutline? masterOutlineComponent;

  factory OutlineComponent.fromJson(Map<String, dynamic> json) =>
      _$OutlineComponentFromJson(json);
  Map<String, dynamic> toJson() => _$OutlineComponentToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      outlineId,
      mstOutlineComponentId,
      title,
      description,
      order,
      createdAt,
      updatedAt,
      createdBy,
      updatedBy,
      masterOutlineComponent,
    ];
  }

  @override
  bool get stringify => true;
}
