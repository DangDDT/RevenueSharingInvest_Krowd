// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StageReturn _$StageReturnFromJson(Map<String, dynamic> json) => StageReturn(
      id: json['id'] as String?,
      projectId: json['projectId'] as String?,
      description: json['description'],
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      status: json['status'] as String?,
      isOverDue: json['isOverDue'],
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'],
      actualAmount: json['actualAmount'] as num?,
      sharedAmount: json['sharedAmount'] as num?,
      paidAmount: json['paidAmount'] as num?,
      receivedAmount: json['receivedAmount'] as num?,
      pessimisticExpectedAmount: json['pessimisticExpectedAmount'] as num?,
      normalExpectedAmount: json['normalExpectedAmount'] as num?,
      optimisticExpectedAmount: json['optimisticExpectedAmount'] as num?,
      pessimisticExpectedRatio: json['pessimisticExpectedRatio'] as num?,
      normalExpectedRatio: json['normalExpectedRatio'] as num?,
      optimisticExpectedRatio: json['optimisticExpectedRatio'] as num?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$StageReturnToJson(StageReturn instance) => <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'isOverDue': instance.isOverDue,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'actualAmount': instance.actualAmount,
      'sharedAmount': instance.sharedAmount,
      'paidAmount': instance.paidAmount,
      'receivedAmount': instance.receivedAmount,
      'pessimisticExpectedAmount': instance.pessimisticExpectedAmount,
      'normalExpectedAmount': instance.normalExpectedAmount,
      'optimisticExpectedAmount': instance.optimisticExpectedAmount,
      'pessimisticExpectedRatio': instance.pessimisticExpectedRatio,
      'normalExpectedRatio': instance.normalExpectedRatio,
      'optimisticExpectedRatio': instance.optimisticExpectedRatio,
      'name': instance.name,
    };
