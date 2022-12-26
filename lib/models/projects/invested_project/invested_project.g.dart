// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invested_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestedProject _$InvestedProjectFromJson(Map<String, dynamic> json) =>
    InvestedProject(
      id: json['id'] as String?,
      managerId: json['managerId'] as String?,
      fieldId: json['fieldId'] as String?,
      areaId: json['areaId'] as String?,
      image: json['image'] as String?,
      investedCapital: json['investedCapital'] as num?,
      numOfStage: json['numOfStage'] as num?,
      remainAmount: json['remainAmount'] as num?,
      businessLicense: json['businessLicense'],
      approvedDate: json['approvedDate'],
      approvedBy: json['approvedBy'],
      status: json['status'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      investedAmount: json['investedAmount'] as num?,
      receivedAmount: json['receivedAmount'] as num?,
      lastestInvestmentDate: json['lastestInvestmentDate'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      investmentTargetCapital: json['investmentTargetCapital'] as num?,
      sharedRevenue: json['sharedRevenue'] as num?,
      multiplier: json['multiplier'] as num?,
      duration: json['duration'] as num?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$InvestedProjectToJson(InvestedProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'managerId': instance.managerId,
      'fieldId': instance.fieldId,
      'areaId': instance.areaId,
      'image': instance.image,
      'investedCapital': instance.investedCapital,
      'numOfStage': instance.numOfStage,
      'remainAmount': instance.remainAmount,
      'businessLicense': instance.businessLicense,
      'approvedDate': instance.approvedDate,
      'approvedBy': instance.approvedBy,
      'status': instance.status,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
      'investedAmount': instance.investedAmount,
      'receivedAmount': instance.receivedAmount,
      'lastestInvestmentDate': instance.lastestInvestmentDate,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'investmentTargetCapital': instance.investmentTargetCapital,
      'sharedRevenue': instance.sharedRevenue,
      'multiplier': instance.multiplier,
      'duration': instance.duration,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
