// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicProject _$BasicProjectFromJson(Map<String, dynamic> json) => BasicProject(
      id: json['id'] as String?,
      businessId: json['businessId'] as String?,
      businessName: json['businessName'] as String?,
      businessImage: json['businessImage'] as String?,
      managerId: json['managerId'] as String?,
      fieldId: json['fieldId'] as String?,
      fieldName: json['fieldName'] as String?,
      fieldDescription: json['fieldDescription'] as String?,
      areaId: json['areaId'] as String?,
      image: json['image'] as String?,
      investedCapital: json['investedCapital'] as num?,
      numOfStage: json['numOfStage'] as num?,
      remainAmount: json['remainAmount'] as num?,
      approvedDate: json['approvedDate'],
      approvedBy: json['approvedBy'],
      status: json['status'] as String?,
      tagList:
          (json['tagList'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      investmentTargetCapital: json['investmentTargetCapital'] as num?,
      sharedRevenue: json['sharedRevenue'] as num?,
      multiplier: json['multiplier'] as num?,
      duration: json['duration'] as int?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$BasicProjectToJson(BasicProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'businessId': instance.businessId,
      'businessName': instance.businessName,
      'businessImage': instance.businessImage,
      'managerId': instance.managerId,
      'fieldId': instance.fieldId,
      'fieldName': instance.fieldName,
      'fieldDescription': instance.fieldDescription,
      'areaId': instance.areaId,
      'image': instance.image,
      'investedCapital': instance.investedCapital,
      'numOfStage': instance.numOfStage,
      'remainAmount': instance.remainAmount,
      'approvedDate': instance.approvedDate,
      'approvedBy': instance.approvedBy,
      'status': instance.status,
      'tagList': instance.tagList,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
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
