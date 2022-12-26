import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'role.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String id;
  final String? business;
  final Role? role;
  final String? description;
  final String? phoneNum;
  final String? idCard;
  final String? email;
  final String? gender;
  final String? dateOfBirth;
  final String? taxIdentificationNumber;
  final String? city;
  final String? district;
  final String? address;
  final String? bankName;
  final String? bankAccount;
  final String? image;
  final String? status;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final bool? isDeleted;
  final String? lastName;
  final String? firstName;

  const User({
    required this.id,
    this.business,
    this.role,
    this.description,
    this.phoneNum,
    this.idCard,
    this.email,
    this.gender,
    this.dateOfBirth,
    this.taxIdentificationNumber,
    this.city,
    this.district,
    this.address,
    this.bankName,
    this.bankAccount,
    this.image,
    this.status,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
    this.lastName,
    this.firstName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? business,
    Role? role,
    String? description,
    String? phoneNum,
    String? idCard,
    String? email,
    String? gender,
    String? dateOfBirth,
    String? taxIdentificationNumber,
    String? city,
    String? district,
    String? address,
    String? bankName,
    String? bankAccount,
    String? image,
    String? status,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    bool? isDeleted,
    String? lastName,
    String? firstName,
  }) {
    return User(
      id: id ?? this.id,
      business: business ?? this.business,
      role: role ?? this.role,
      description: description ?? this.description,
      phoneNum: phoneNum ?? this.phoneNum,
      idCard: idCard ?? this.idCard,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      taxIdentificationNumber:
          taxIdentificationNumber ?? this.taxIdentificationNumber,
      city: city ?? this.city,
      district: district ?? this.district,
      address: address ?? this.address,
      bankName: bankName ?? this.bankName,
      bankAccount: bankAccount ?? this.bankAccount,
      image: image ?? this.image,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      isDeleted: isDeleted ?? this.isDeleted,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      business,
      role,
      description,
      phoneNum,
      idCard,
      email,
      gender,
      dateOfBirth,
      taxIdentificationNumber,
      city,
      district,
      address,
      bankName,
      bankAccount,
      image,
      status,
      createDate,
      createBy,
      updateDate,
      updateBy,
      isDeleted,
      lastName,
      firstName,
    ];
  }
}
