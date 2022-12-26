// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectEntity _$ProjectEntityFromJson(Map<String, dynamic> json) =>
    ProjectEntity(
      type: json['type'] as String?,
      typeItemList: (json['typeItemList'] as List<dynamic>?)
          ?.map((e) => TypeItemList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectEntityToJson(ProjectEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'typeItemList': instance.typeItemList,
    };
