import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'area.dart';
import 'business.dart';
import 'field.dart';
import 'manager.dart';
import 'member_list.dart';
import 'project_entity.dart';

part 'project.g.dart';

@JsonSerializable()
class ProjectDetail extends Equatable {
  final String? id;
  final String? image;
  final Business? business;
  final Manager? manager;
  final Field? field;
  final Area? area;
  final List<ProjectEntity>? projectEntity;
  final List<Member>? memberList;
  final num? remainAmount;
  final String? approvedDate;
  final String? approvedBy;
  final String? status;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final bool? isDeleted;
  final String? name;
  final String? description;
  final String? address;
  final num? investmentTargetCapital;
  final num? investedCapital;
  final num? sharedRevenue;
  final num? multiplier;
  final num? duration;
  final num? numOfStage;
  final String? startDate;
  final String? endDate;
  final String? businessLicense;

  const ProjectDetail({
    this.id,
    this.image,
    this.business,
    this.manager,
    this.field,
    this.area,
    this.projectEntity,
    this.memberList,
    this.remainAmount,
    this.approvedDate,
    this.approvedBy,
    this.status,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
    this.name,
    this.description,
    this.address,
    this.investmentTargetCapital,
    this.investedCapital,
    this.sharedRevenue,
    this.multiplier,
    this.duration,
    this.numOfStage,
    this.startDate,
    this.endDate,
    this.businessLicense,
  });

  factory ProjectDetail.fromJson(Map<String, dynamic> json) {
    return _$ProjectDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProjectDetailToJson(this);

  ProjectDetail copyWith({
    String? id,
    String? image,
    Business? business,
    Manager? manager,
    Field? field,
    Area? area,
    List<ProjectEntity>? projectEntity,
    List<Member>? memberList,
    num? remainAmount,
    String? approvedDate,
    String? approvedBy,
    String? status,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    bool? isDeleted,
    String? name,
    String? description,
    String? address,
    num? investmentTargetCapital,
    num? investedCapital,
    num? sharedRevenue,
    num? multiplier,
    num? duration,
    num? numOfStage,
    String? startDate,
    String? endDate,
    String? businessLicense,
  }) {
    return ProjectDetail(
      id: id ?? this.id,
      image: image ?? this.image,
      business: business ?? this.business,
      manager: manager ?? this.manager,
      field: field ?? this.field,
      area: area ?? this.area,
      projectEntity: projectEntity ?? this.projectEntity,
      memberList: memberList ?? this.memberList,
      remainAmount: remainAmount ?? this.remainAmount,
      approvedDate: approvedDate ?? this.approvedDate,
      approvedBy: approvedBy ?? this.approvedBy,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      isDeleted: isDeleted ?? this.isDeleted,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      investmentTargetCapital:
          investmentTargetCapital ?? this.investmentTargetCapital,
      investedCapital: investedCapital ?? this.investedCapital,
      sharedRevenue: sharedRevenue ?? this.sharedRevenue,
      multiplier: multiplier ?? this.multiplier,
      duration: duration ?? this.duration,
      numOfStage: numOfStage ?? this.numOfStage,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      businessLicense: businessLicense ?? this.businessLicense,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      image,
      business,
      manager,
      field,
      area,
      projectEntity,
      memberList,
      remainAmount,
      approvedDate,
      approvedBy,
      status,
      createDate,
      createBy,
      updateDate,
      updateBy,
      isDeleted,
      name,
      description,
      address,
      investmentTargetCapital,
      investedCapital,
      sharedRevenue,
      multiplier,
      duration,
      numOfStage,
      startDate,
      endDate,
      businessLicense,
    ];
  }
}
