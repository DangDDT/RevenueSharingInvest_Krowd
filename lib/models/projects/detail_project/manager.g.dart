// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manager _$ManagerFromJson(Map<String, dynamic> json) => Manager(
      id: json['id'] as String?,
      description: json['description'] as String?,
      phoneNum: json['phoneNum'] as String?,
      idCard: json['idCard'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      taxIdentificationNumber: json['taxIdentificationNumber'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      address: json['address'] as String?,
      bankName: json['bankName'] as String?,
      bankAccount: json['bankAccount'] as String?,
      image: json['image'] as String?,
      status: json['status'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'],
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'],
      isDeleted: json['isDeleted'] as bool?,
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
    );

Map<String, dynamic> _$ManagerToJson(Manager instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'phoneNum': instance.phoneNum,
      'idCard': instance.idCard,
      'email': instance.email,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'taxIdentificationNumber': instance.taxIdentificationNumber,
      'city': instance.city,
      'district': instance.district,
      'address': instance.address,
      'bankName': instance.bankName,
      'bankAccount': instance.bankAccount,
      'image': instance.image,
      'status': instance.status,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
    };
