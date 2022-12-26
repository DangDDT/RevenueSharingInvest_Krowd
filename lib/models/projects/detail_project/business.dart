import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'field_list.dart';
import 'manager.dart';

part 'business.g.dart';

@JsonSerializable()
class Business extends Equatable {
  final String? id;
  final Manager? manager;
  final List<FieldList>? fieldList;
  final String? image;
  final num? numOfProject;
  final num? numOfSuccessfulProject;
  final num? successfulRate;
  final String? status;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final bool? isDeleted;
  final String? name;
  final String? phoneNum;
  final String? email;
  final String? description;
  final String? taxIdentificationNumber;
  final String? address;

  const Business({
    this.id,
    this.manager,
    this.fieldList,
    this.image,
    this.numOfProject,
    this.numOfSuccessfulProject,
    this.successfulRate,
    this.status,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
    this.name,
    this.phoneNum,
    this.email,
    this.description,
    this.taxIdentificationNumber,
    this.address,
  });

  factory Business.fromJson(Map<String, dynamic> json) {
    return _$BusinessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BusinessToJson(this);

  Business copyWith({
    String? id,
    Manager? manager,
    List<FieldList>? fieldList,
    String? image,
    num? numOfProject,
    num? numOfSuccessfulProject,
    num? successfulRate,
    String? status,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    bool? isDeleted,
    String? name,
    String? phoneNum,
    String? email,
    String? description,
    String? taxIdentificationNumber,
    String? address,
  }) {
    return Business(
      id: id ?? this.id,
      manager: manager ?? this.manager,
      fieldList: fieldList ?? this.fieldList,
      image: image ?? this.image,
      numOfProject: numOfProject ?? this.numOfProject,
      numOfSuccessfulProject:
          numOfSuccessfulProject ?? this.numOfSuccessfulProject,
      successfulRate: successfulRate ?? this.successfulRate,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      isDeleted: isDeleted ?? this.isDeleted,
      name: name ?? this.name,
      phoneNum: phoneNum ?? this.phoneNum,
      email: email ?? this.email,
      description: description ?? this.description,
      taxIdentificationNumber:
          taxIdentificationNumber ?? this.taxIdentificationNumber,
      address: address ?? this.address,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      manager,
      fieldList,
      image,
      numOfProject,
      numOfSuccessfulProject,
      successfulRate,
      status,
      createDate,
      createBy,
      updateDate,
      updateBy,
      isDeleted,
      name,
      phoneNum,
      email,
      description,
      taxIdentificationNumber,
      address,
    ];
  }
}
