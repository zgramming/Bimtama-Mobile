// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa_outline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaOutlineModel _$MahasiswaOutlineModelFromJson(
        Map<String, dynamic> json) =>
    MahasiswaOutlineModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : MahasiswaOutlineData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MahasiswaOutlineModelToJson(
        MahasiswaOutlineModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MahasiswaOutlineData _$MahasiswaOutlineDataFromJson(
        Map<String, dynamic> json) =>
    MahasiswaOutlineData(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      outlineId: json['outline_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      outline: json['outline'] == null
          ? null
          : Outline.fromJson(json['outline'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MahasiswaOutlineDataToJson(
        MahasiswaOutlineData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'outline_id': instance.outlineId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'outline': instance.outline,
      'user': instance.user,
    };

Outline _$OutlineFromJson(Map<String, dynamic> json) => Outline(
      id: json['id'] as int?,
      mstOutlineId: json['mst_outline_id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$OutlineToJson(Outline instance) => <String, dynamic>{
      'id': instance.id,
      'mst_outline_id': instance.mstOutlineId,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      appGroupUserId: json['app_group_user_id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'app_group_user_id': instance.appGroupUserId,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
    };
