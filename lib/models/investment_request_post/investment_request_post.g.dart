// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_request_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentRequestPost _$InvestmentRequestPostFromJson(
        Map<String, dynamic> json) =>
    InvestmentRequestPost(
      projectId: json['projectId'] as String,
      packageId: json['packageId'] as String,
      quantity: json['quantity'] as num,
    );

Map<String, dynamic> _$InvestmentRequestPostToJson(
        InvestmentRequestPost instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'packageId': instance.packageId,
      'quantity': instance.quantity,
    };
