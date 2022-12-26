// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map<String, dynamic> json) => Package(
      id: json['id'] as String,
      descriptionList: (json['descriptionList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      remainingQuantity: json['remainingQuantity'] as num,
      status: json['status'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      name: json['name'] as String,
      price: json['price'] as num,
      image: json['image'],
      quantity: json['quantity'] as num,
    );

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'id': instance.id,
      'descriptionList': instance.descriptionList,
      'remainingQuantity': instance.remainingQuantity,
      'status': instance.status,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'quantity': instance.quantity,
    };
