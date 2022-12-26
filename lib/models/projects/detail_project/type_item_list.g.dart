// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeItemList _$TypeItemListFromJson(Map<String, dynamic> json) => TypeItemList(
      id: json['id'] as String?,
      priority: json['priority'] as int?,
      title: json['title'] as String?,
      link: json['link'],
      content: json['content'] as String?,
      description: json['description'],
    );

Map<String, dynamic> _$TypeItemListToJson(TypeItemList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'priority': instance.priority,
      'title': instance.title,
      'link': instance.link,
      'content': instance.content,
      'description': instance.description,
    };
