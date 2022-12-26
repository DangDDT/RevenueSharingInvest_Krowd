import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basic_project.g.dart';

@JsonSerializable()
class BasicProject extends Equatable {
  final String? id;
  final String? businessId;
  final String? businessName;
  final String? businessImage;
  final String? managerId;
  final String? fieldId;
  final String? fieldName;
  final String? fieldDescription;
  final String? areaId;
  final String? image;
  final num? investedCapital;
  final num? numOfStage;
  final num? remainAmount;
  final dynamic approvedDate;
  final dynamic approvedBy;
  final String? status;
  final List<String>? tagList;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final bool? isDeleted;
  final String? name;
  final String? description;
  final String? address;
  final num? investmentTargetCapital;
  final num? sharedRevenue;
  final num? multiplier;
  final int? duration;
  final String? startDate;
  final String? endDate;

  const BasicProject({
    this.id,
    this.businessId,
    this.businessName,
    this.businessImage,
    this.managerId,
    this.fieldId,
    this.fieldName,
    this.fieldDescription,
    this.areaId,
    this.image,
    this.investedCapital,
    this.numOfStage,
    this.remainAmount,
    this.approvedDate,
    this.approvedBy,
    this.status,
    this.tagList,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
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

  factory BasicProject.fromJson(Map<String, dynamic> json) {
    return _$BasicProjectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BasicProjectToJson(this);

  BasicProject copyWith({
    String? id,
    String? businessId,
    String? businessName,
    String? businessImage,
    String? managerId,
    String? fieldId,
    String? fieldName,
    String? fieldDescription,
    String? areaId,
    String? image,
    num? investedCapital,
    num? numOfStage,
    num? remainAmount,
    dynamic approvedDate,
    dynamic approvedBy,
    String? status,
    List<String>? tagList,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    bool? isDeleted,
    String? name,
    String? description,
    String? address,
    num? investmentTargetCapital,
    num? sharedRevenue,
    num? multiplier,
    int? duration,
    String? startDate,
    String? endDate,
  }) {
    return BasicProject(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      businessName: businessName ?? this.businessName,
      businessImage: businessImage ?? this.businessImage,
      managerId: managerId ?? this.managerId,
      fieldId: fieldId ?? this.fieldId,
      fieldName: fieldName ?? this.fieldName,
      fieldDescription: fieldDescription ?? this.fieldDescription,
      areaId: areaId ?? this.areaId,
      image: image ?? this.image,
      investedCapital: investedCapital ?? this.investedCapital,
      numOfStage: numOfStage ?? this.numOfStage,
      remainAmount: remainAmount ?? this.remainAmount,
      approvedDate: approvedDate ?? this.approvedDate,
      approvedBy: approvedBy ?? this.approvedBy,
      status: status ?? this.status,
      tagList: tagList ?? this.tagList,
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
      businessId,
      businessName,
      businessImage,
      managerId,
      fieldId,
      fieldName,
      fieldDescription,
      areaId,
      image,
      investedCapital,
      numOfStage,
      remainAmount,
      approvedDate,
      approvedBy,
      status,
      tagList,
      createDate,
      createBy,
      updateDate,
      updateBy,
      isDeleted,
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
