// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_outline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminOutlineModel _$AdminOutlineModelFromJson(Map<String, dynamic> json) =>
    AdminOutlineModel(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AdminOutlineData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminOutlineModelToJson(AdminOutlineModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

AdminOutlineData _$AdminOutlineDataFromJson(Map<String, dynamic> json) =>
    AdminOutlineData(
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
      masterOutline: json['master_outline'] == null
          ? null
          : MasterOutline.fromJson(
              json['master_outline'] as Map<String, dynamic>),
      outlineComponent: (json['outline_component'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : OutlineComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminOutlineDataToJson(AdminOutlineData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mst_outline_id': instance.mstOutlineId,
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'master_outline': instance.masterOutline,
      'outline_component': instance.outlineComponent,
    };

MasterOutline _$MasterOutlineFromJson(Map<String, dynamic> json) =>
    MasterOutline(
      id: json['id'] as int?,
      masterDataId: json['master_data_id'],
      masterCategoryId: json['master_category_id'] as int?,
      masterCategoryCode: json['master_category_code'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      description: json['description'],
      status: json['status'] as String?,
      parameter1Key: json['parameter1_key'],
      parameter1Value: json['parameter1_value'],
      parameter2Key: json['parameter2_key'],
      parameter2Value: json['parameter2_value'],
      parameter3Key: json['parameter3_key'],
      parameter3Value: json['parameter3_value'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
    );

Map<String, dynamic> _$MasterOutlineToJson(MasterOutline instance) =>
    <String, dynamic>{
      'id': instance.id,
      'master_data_id': instance.masterDataId,
      'master_category_id': instance.masterCategoryId,
      'master_category_code': instance.masterCategoryCode,
      'code': instance.code,
      'name': instance.name,
      'order': instance.order,
      'description': instance.description,
      'status': instance.status,
      'parameter1_key': instance.parameter1Key,
      'parameter1_value': instance.parameter1Value,
      'parameter2_key': instance.parameter2Key,
      'parameter2_value': instance.parameter2Value,
      'parameter3_key': instance.parameter3Key,
      'parameter3_value': instance.parameter3Value,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

OutlineComponent _$OutlineComponentFromJson(Map<String, dynamic> json) =>
    OutlineComponent(
      id: json['id'] as String?,
      outlineId: json['outline_id'] as int?,
      mstOutlineComponentId: json['mst_outline_component_id'] as int?,
      title: json['title'] as String?,
      description: json['description'],
      order: json['order'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      masterOutlineComponent: json['master_outline_component'] == null
          ? null
          : MasterOutline.fromJson(
              json['master_outline_component'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OutlineComponentToJson(OutlineComponent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'outline_id': instance.outlineId,
      'mst_outline_component_id': instance.mstOutlineComponentId,
      'title': instance.title,
      'description': instance.description,
      'order': instance.order,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'master_outline_component': instance.masterOutlineComponent,
    };
