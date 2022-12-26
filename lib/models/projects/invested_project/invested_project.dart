import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invested_project.g.dart';

@JsonSerializable()
class InvestedProject extends Equatable {
  final String? id;
  final String? managerId;
  final String? fieldId;
  final String? areaId;
  final String? image;
  final num? investedCapital;
  final num? numOfStage;
  final num? remainAmount;
  final dynamic businessLicense;
  final dynamic approvedDate;
  final dynamic approvedBy;
  final String? status;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final bool? isDeleted;
  final num? investedAmount;
  final num? receivedAmount;
  final String? lastestInvestmentDate;
  final String? name;
  final String? description;
  final String? address;
  final num? investmentTargetCapital;
  final num? sharedRevenue;
  final num? multiplier;
  final num? duration;
  final String? startDate;
  final String? endDate;

  const InvestedProject({
    this.id,
    this.managerId,
    this.fieldId,
    this.areaId,
    this.image,
    this.investedCapital,
    this.numOfStage,
    this.remainAmount,
    this.businessLicense,
    this.approvedDate,
    this.approvedBy,
    this.status,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
    this.investedAmount,
    this.receivedAmount,
    this.lastestInvestmentDate,
    this.name,
    this.description,
    this.address,
    this.investmentTargetCapital,
    this.sharedRevenue,
    this.multiplier,
    this.duration,
    this.startDate,
    this.endDate,
  });

  factory InvestedProject.fromJson(Map<String, dynamic> json) {
    return _$InvestedProjectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvestedProjectToJson(this);

  InvestedProject copyWith({
    String? id,
    String? managerId,
    String? fieldId,
    String? areaId,
    String? image,
    num? investedCapital,
    num? numOfStage,
    num? remainAmount,
    dynamic businessLicense,
    dynamic approvedDate,
    dynamic approvedBy,
    String? status,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    bool? isDeleted,
    num? investedAmount,
    num? receivedAmount,
    String? lastestInvestmentDate,
    String? name,
    String? description,
    String? address,
    num? investmentTargetCapital,
    num? sharedRevenue,
    double? multiplier,
    num? duration,
    String? startDate,
    String? endDate,
  }) {
    return InvestedProject(
      id: id ?? this.id,
      managerId: managerId ?? this.managerId,
      fieldId: fieldId ?? this.fieldId,
      areaId: areaId ?? this.areaId,
      image: image ?? this.image,
      investedCapital: investedCapital ?? this.investedCapital,
      numOfStage: numOfStage ?? this.numOfStage,
      remainAmount: remainAmount ?? this.remainAmount,
      businessLicense: businessLicense ?? this.businessLicense,
      approvedDate: approvedDate ?? this.approvedDate,
      approvedBy: approvedBy ?? this.approvedBy,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      isDeleted: isDeleted ?? this.isDeleted,
      investedAmount: investedAmount ?? this.investedAmount,
      receivedAmount: receivedAmount ?? this.receivedAmount,
      lastestInvestmentDate:
          lastestInvestmentDate ?? this.lastestInvestmentDate,
      name: name ?? this.name,
      description: description ?? this.description,
      address: address ?? this.address,
      investmentTargetCapital:
          investmentTargetCapital ?? this.investmentTargetCapital,
      sharedRevenue: sharedRevenue ?? this.sharedRevenue,
      multiplier: multiplier ?? this.multiplier,
      duration: duration ?? this.duration,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      managerId,
      fieldId,
      areaId,
      image,
      investedCapital,
      numOfStage,
      remainAmount,
      businessLicense,
      approvedDate,
      approvedBy,
      status,
      createDate,
      createBy,
      updateDate,
      updateBy,
      isDeleted,
      investedAmount,
      receivedAmount,
      lastestInvestmentDate,
      name,
      description,
      address,
      investmentTargetCapital,
      sharedRevenue,
      multiplier,
      duration,
      startDate,
      endDate,
    ];
  }
}
