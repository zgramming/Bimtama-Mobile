import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'mahasiswa_guidance_outline_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaGuidanceOutlineModel extends Equatable {
  const MahasiswaGuidanceOutlineModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final MahasiswaGuidanceOutlineData? data;

  factory MahasiswaGuidanceOutlineModel.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaGuidanceOutlineModelFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaGuidanceOutlineModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaGuidanceOutlineData extends Equatable {
  const MahasiswaGuidanceOutlineData({
    this.id,
    this.userId,
    this.outlineId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.user,
    this.outline,
  });

  final int? id;
  final int? userId;
  final int? outlineId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final User? user;
  final Outline? outline;

  factory MahasiswaGuidanceOutlineData.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaGuidanceOutlineDataFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaGuidanceOutlineDataToJson(this);

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
      user,
      outline,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class Outline extends Equatable {
  const Outline({
    this.id,
    this.mstOutlineId,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
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
  final List<OutlineComponent?>? outlineComponent;

  factory Outline.fromJson(Map<String, dynamic> json) =>
      _$OutlineFromJson(json);
  Map<String, dynamic> toJson() => _$OutlineToJson(this);

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
      outlineComponent,
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
    this.title,
    this.mstOutlineComponentId,
    this.outlineId,
    this.order,
    this.masterOutlineComponent,
  });

  final String? id;
  final String? title;
  final int? mstOutlineComponentId;
  final int? outlineId;
  final int? order;
  final MasterOutlineComponent? masterOutlineComponent;

  factory OutlineComponent.fromJson(Map<String, dynamic> json) =>
      _$OutlineComponentFromJson(json);
  Map<String, dynamic> toJson() => _$OutlineComponentToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      title,
      mstOutlineComponentId,
      outlineId,
      order,
      masterOutlineComponent,
    ];
  }

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MasterOutlineComponent extends Equatable {
  const MasterOutlineComponent({
    this.id,
    this.name,
    this.code,
  });

  final int? id;
  final String? name;
  final String? code;

  factory MasterOutlineComponent.fromJson(Map<String, dynamic> json) =>
      _$MasterOutlineComponentFromJson(json);
  Map<String, dynamic> toJson() => _$MasterOutlineComponentToJson(this);

  @override
  List<Object?> get props => [id, name, code];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class User extends Equatable {
  const User({
    this.id,
    this.appGroupUserId,
    this.name,
    this.username,
  });

  final int? id;
  final int? appGroupUserId;
  final String? name;
  final String? username;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, appGroupUserId, name, username];

  @override
  bool get stringify => true;
}
