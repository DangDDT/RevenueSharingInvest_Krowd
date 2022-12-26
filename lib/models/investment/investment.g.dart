// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Investment _$InvestmentFromJson(Map<String, dynamic> json) => Investment(
      id: json['id'] as String?,
      investorId: json['investorId'] as String?,
      totalPrice: json['totalPrice'] as num?,
      status: json['status'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      investorName: json['investorName'] as String?,
      investorImage: json['investorImage'] as String?,
      investorEmail: json['investorEmail'] as String?,
      packageName: json['packageName'] as String?,
      packagePrice: json['packagePrice'] as num?,
      projectName: json['projectName'] as String?,
      projectId: json['projectId'] as String?,
      packageId: json['packageId'] as String?,
      quantity: json['quantity'] as num?,
    );

Map<String, dynamic> _$InvestmentToJson(Investment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'investorId': instance.investorId,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'investorName': instance.investorName,
      'investorImage': instance.investorImage,
      'investorEmail': instance.investorEmail,
      'packageName': instance.packageName,
      'packagePrice': instance.packagePrice,
      'projectName': instance.projectName,
      'projectId': instance.projectId,
      'packageId': instance.packageId,
      'quantity': instance.quantity,
    };
