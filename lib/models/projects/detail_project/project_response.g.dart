// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResponse _$ProjectResponseFromJson(Map<String, dynamic> json) =>
    ProjectResponse(
      numOfProject: json['numOfProject'] as num?,
      listOfProject: (json['listOfProject'] as List<dynamic>?)
          ?.map((e) => ProjectDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectResponseToJson(ProjectResponse instance) =>
    <String, dynamic>{
      'numOfProject': instance.numOfProject,
      'listOfProject': instance.listOfProject,
    };
