// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pitch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pitch _$PitchFromJson(Map<String, dynamic> json) => Pitch(
      id: json['id'] as String?,
      priority: json['priority'] as num?,
      projectId: json['projectId'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'],
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'],
      isDeleted: json['isDeleted'] as bool?,
      title: json['title'] as String?,
      link: json['link'],
      content: json['content'] as String?,
      description: json['description'],
    );

Map<String, dynamic> _$PitchToJson(Pitch instance) => <String, dynamic>{
      'id': instance.id,
      'priority': instance.priority,
      'projectId': instance.projectId,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
      'title': instance.title,
      'link': instance.link,
      'content': instance.content,
      'description': instance.description,
    };
