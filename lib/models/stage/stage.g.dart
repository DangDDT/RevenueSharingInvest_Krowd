// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stage _$StageFromJson(Map<String, dynamic> json) => Stage(
      id: json['id'] as String?,
      projectId: json['projectId'] as String?,
      description: json['description'],
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      status: json['status'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      pessimisticExpectedAmount:
          (json['pessimisticExpectedAmount'] as num?)?.toDouble(),
      normalExpectedAmount: (json['normalExpectedAmount'] as num?)?.toDouble(),
      optimisticExpectedAmount:
          (json['optimisticExpectedAmount'] as num?)?.toDouble(),
      pessimisticExpectedRatio:
          (json['pessimisticExpectedRatio'] as num?)?.toDouble(),
      normalExpectedRatio: (json['normalExpectedRatio'] as num?)?.toDouble(),
      optimisticExpectedRatio:
          (json['optimisticExpectedRatio'] as num?)?.toDouble(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StageToJson(Stage instance) => <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
      'pessimisticExpectedAmount': instance.pessimisticExpectedAmount,
      'normalExpectedAmount': instance.normalExpectedAmount,
      'optimisticExpectedAmount': instance.optimisticExpectedAmount,
      'pessimisticExpectedRatio': instance.pessimisticExpectedRatio,
      'normalExpectedRatio': instance.normalExpectedRatio,
      'optimisticExpectedRatio': instance.optimisticExpectedRatio,
      'name': instance.name,
    };
