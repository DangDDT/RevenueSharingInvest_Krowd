// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Member _$MemberFromJson(Map<String, dynamic> json) => Member(
      image: json['image'],
      investDate: json['investDate'],
      lastName: json['lastName'] as String?,
      firstName: json['firstName'] as String?,
    );

Map<String, dynamic> _$MemberToJson(Member instance) => <String, dynamic>{
      'image': instance.image,
      'investDate': instance.investDate,
      'lastName': instance.lastName,
      'firstName': instance.firstName,
    };
