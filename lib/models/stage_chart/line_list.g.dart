// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Line _$LineFromJson(Map<String, dynamic> json) => Line(
      name: json['name'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$LineToJson(Line instance) => <String, dynamic>{
      'name': instance.name,
      'data': instance.data,
    };
