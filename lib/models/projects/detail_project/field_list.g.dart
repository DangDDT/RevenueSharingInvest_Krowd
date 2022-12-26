// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldList _$FieldListFromJson(Map<String, dynamic> json) => FieldList(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$FieldListToJson(FieldList instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
    };
