// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      title: json['title'] as String?,
      entityId: json['entityId'] as String?,
      image: json['image'] as String?,
      createDate: json['createDate'] as String?,
      seen: json['seen'] as bool?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'entityId': instance.entityId,
      'image': instance.image,
      'createDate': instance.createDate,
      'seen': instance.seen,
    };
