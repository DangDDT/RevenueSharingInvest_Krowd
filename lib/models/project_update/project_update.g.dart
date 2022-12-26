// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectUpdate _$ProjectUpdateFromJson(Map<String, dynamic> json) =>
    ProjectUpdate(
      id: json['id'] as String?,
      priority: json['priority'] as num?,
      projectId: json['projectId'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      title: json['title'] as String?,
      link: json['link'],
      content: json['content'] as String?,
      description: json['description'],
    );

Map<String, dynamic> _$ProjectUpdateToJson(ProjectUpdate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'priority': instance.priority,
      'projectId': instance.projectId,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'title': instance.title,
      'link': instance.link,
      'content': instance.content,
      'description': instance.description,
    };
