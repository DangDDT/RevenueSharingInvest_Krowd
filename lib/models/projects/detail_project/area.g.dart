// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'],
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'],
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'district': instance.district,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
    };
