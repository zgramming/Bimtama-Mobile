import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
part 'mahasiswa_profile_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaProfileModel extends Equatable {
  const MahasiswaProfileModel({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final MahasiswaProfileData? data;

  factory MahasiswaProfileModel.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaProfileModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];

  @override
  bool get stringify => true;
}

@JsonSerializable(fieldRename: FieldRename.snake)
@immutable
class MahasiswaProfileData extends Equatable {
  const MahasiswaProfileData({
    this.id,
    this.appGroupUserId,
    this.username,
    this.name,
    this.phone,
    this.email,
  });

  final int? id;
  final int? appGroupUserId;
  final String? username;
  final String? name;
  final String? phone;
  final String? email;

  factory MahasiswaProfileData.fromJson(Map<String, dynamic> json) =>
      _$MahasiswaProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$MahasiswaProfileDataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      appGroupUserId,
      username,
      name,
      phone,
      email,
    ];
  }

  @override
  bool get stringify => true;
}
