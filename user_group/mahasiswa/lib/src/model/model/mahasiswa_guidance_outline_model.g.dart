// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mahasiswa_guidance_outline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MahasiswaGuidanceOutlineModel _$MahasiswaGuidanceOutlineModelFromJson(
        Map<String, dynamic> json) =>
    MahasiswaGuidanceOutlineModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : MahasiswaGuidanceOutlineData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MahasiswaGuidanceOutlineModelToJson(
        MahasiswaGuidanceOutlineModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

MahasiswaGuidanceOutlineData _$MahasiswaGuidanceOutlineDataFromJson(
        Map<String, dynamic> json) =>
    MahasiswaGuidanceOutlineData(
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
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      outline: json['outline'] == null
          ? null
          : Outline.fromJson(json['outline'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MahasiswaGuidanceOutlineDataToJson(
        MahasiswaGuidanceOutlineData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'outline_id': instance.outlineId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'user': instance.user,
      'outline': instance.outline,
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
      outlineComponent: (json['outline_component'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OutlineComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'outline_component': instance.outlineComponent,
    };

OutlineComponent _$OutlineComponentFromJson(Map<String, dynamic> json) =>
    OutlineComponent(
      id: json['id'] as String?,
      title: json['title'] as String?,
      mstOutlineComponentId: json['mst_outline_component_id'] as int?,
      outlineId: json['outline_id'] as int?,
      order: json['order'] as int?,
      masterOutlineComponent: json['master_outline_component'] == null
          ? null
          : MasterOutlineComponent.fromJson(
              json['master_outline_component'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OutlineComponentToJson(OutlineComponent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'mst_outline_component_id': instance.mstOutlineComponentId,
      'outline_id': instance.outlineId,
      'order': instance.order,
      'master_outline_component': instance.masterOutlineComponent,
    };

MasterOutlineComponent _$MasterOutlineComponentFromJson(
        Map<String, dynamic> json) =>
    MasterOutlineComponent(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$MasterOutlineComponentToJson(
        MasterOutlineComponent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      appGroupUserId: json['app_group_user_id'] as int?,
      name: json['name'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'app_group_user_id': instance.appGroupUserId,
      'name': instance.name,
      'username': instance.username,
    };
