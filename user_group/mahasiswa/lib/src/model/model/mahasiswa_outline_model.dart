import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';

part 'mahasiswa_outline_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaOutlineModel extends Equatable {
  const MahasiswaOutlineModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final MahasiswaOutlineData? data;

  factory MahasiswaOutlineModel.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaOutlineModelFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaOutlineModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaOutlineData extends Equatable {
  const MahasiswaOutlineData({
    this.id,
    this.userId,
    this.outlineId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.outline,
    this.user,
  });

  final int? id;
  final int? userId;
  final int? outlineId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;
  final Outline? outline;
  final User? user;

  factory MahasiswaOutlineData.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaOutlineDataFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaOutlineDataToJson(this);

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
      outline,
      user,
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
  });

  final int? id;
  final int? mstOutlineId;
  final String? title;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic createdBy;
  final dynamic updatedBy;

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
    ];
  }

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
    this.email,
  });

  final int? id;
  final int? appGroupUserId;
  final String? name;
  final String? username;
  final String? email;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      appGroupUserId,
      name,
      username,
      email,
    ];
  }

  @override
  bool get stringify => true;
}
