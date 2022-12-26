// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Business _$BusinessFromJson(Map<String, dynamic> json) => Business(
      id: json['id'] as String?,
      manager: json['manager'] == null
          ? null
          : Manager.fromJson(json['manager'] as Map<String, dynamic>),
      fieldList: (json['fieldList'] as List<dynamic>?)
          ?.map((e) => FieldList.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String?,
      numOfProject: json['numOfProject'] as num?,
      numOfSuccessfulProject: json['numOfSuccessfulProject'] as num?,
      successfulRate: json['successfulRate'] as num?,
      status: json['status'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      name: json['name'] as String?,
      phoneNum: json['phoneNum'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String?,
      taxIdentificationNumber: json['taxIdentificationNumber'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$BusinessToJson(Business instance) => <String, dynamic>{
      'id': instance.id,
      'manager': instance.manager,
      'fieldList': instance.fieldList,
      'image': instance.image,
      'numOfProject': instance.numOfProject,
      'numOfSuccessfulProject': instance.numOfSuccessfulProject,
      'successfulRate': instance.successfulRate,
      'status': instance.status,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
      'name': instance.name,
      'phoneNum': instance.phoneNum,
      'email': instance.email,
      'description': instance.description,
      'taxIdentificationNumber': instance.taxIdentificationNumber,
      'address': instance.address,
    };
