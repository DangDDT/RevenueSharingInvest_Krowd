// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDetail _$ProjectDetailFromJson(Map<String, dynamic> json) =>
    ProjectDetail(
      id: json['id'] as String?,
      image: json['image'] as String?,
      business: json['business'] == null
          ? null
          : Business.fromJson(json['business'] as Map<String, dynamic>),
      manager: json['manager'] == null
          ? null
          : Manager.fromJson(json['manager'] as Map<String, dynamic>),
      field: json['field'] == null
          ? null
          : Field.fromJson(json['field'] as Map<String, dynamic>),
      area: json['area'] == null
          ? null
          : Area.fromJson(json['area'] as Map<String, dynamic>),
      projectEntity: (json['projectEntity'] as List<dynamic>?)
          ?.map((e) => ProjectEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      memberList: (json['memberList'] as List<dynamic>?)
          ?.map((e) => Member.fromJson(e as Map<String, dynamic>))
          .toList(),
      remainAmount: json['remainAmount'] as num?,
      approvedDate: json['approvedDate'] as String?,
      approvedBy: json['approvedBy'] as String?,
      status: json['status'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      investmentTargetCapital: json['investmentTargetCapital'] as num?,
      investedCapital: json['investedCapital'] as num?,
      sharedRevenue: json['sharedRevenue'] as num?,
      multiplier: json['multiplier'] as num?,
      duration: json['duration'] as num?,
      numOfStage: json['numOfStage'] as num?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      businessLicense: json['businessLicense'] as String?,
    );

Map<String, dynamic> _$ProjectDetailToJson(ProjectDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'business': instance.business,
      'manager': instance.manager,
      'field': instance.field,
      'area': instance.area,
      'projectEntity': instance.projectEntity,
      'memberList': instance.memberList,
      'remainAmount': instance.remainAmount,
      'approvedDate': instance.approvedDate,
      'approvedBy': instance.approvedBy,
      'status': instance.status,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'investmentTargetCapital': instance.investmentTargetCapital,
      'investedCapital': instance.investedCapital,
      'sharedRevenue': instance.sharedRevenue,
      'multiplier': instance.multiplier,
      'duration': instance.duration,
      'numOfStage': instance.numOfStage,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'businessLicense': instance.businessLicense,
    };
