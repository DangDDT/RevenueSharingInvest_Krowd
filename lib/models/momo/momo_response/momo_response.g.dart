// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'momo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomoResponse _$MomoResponseFromJson(Map<String, dynamic> json) => MomoResponse(
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
      id: json['id'] as num?,
      exception: json['exception'],
      status: json['status'] as num?,
      isCanceled: json['isCanceled'] as bool?,
      isCompleted: json['isCompleted'] as bool?,
      isCompletedSuccessfully: json['isCompletedSuccessfully'] as bool?,
      creationOptions: json['creationOptions'] as num?,
      asyncState: json['asyncState'],
      isFaulted: json['isFaulted'] as bool?,
    );

Map<String, dynamic> _$MomoResponseToJson(MomoResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'id': instance.id,
      'exception': instance.exception,
      'status': instance.status,
      'isCanceled': instance.isCanceled,
      'isCompleted': instance.isCompleted,
      'isCompletedSuccessfully': instance.isCompletedSuccessfully,
      'creationOptions': instance.creationOptions,
      'asyncState': instance.asyncState,
      'isFaulted': instance.isFaulted,
    };
