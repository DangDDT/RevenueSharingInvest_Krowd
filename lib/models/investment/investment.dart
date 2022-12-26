import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investment.g.dart';

@JsonSerializable()
class Investment extends Equatable {
  final String? id;
  final String? investorId;
  final num? totalPrice;
  final String? status;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final String? investorName;
  final String? investorImage;
  final String? investorEmail;
  final String? packageName;
  final num? packagePrice;
  final String? projectName;
  final String? projectId;
  final String? packageId;
  final num? quantity;

  const Investment({
    this.id,
    this.investorId,
    this.totalPrice,
    this.status,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.investorName,
    this.investorImage,
    this.investorEmail,
    this.packageName,
    this.packagePrice,
    this.projectName,
    this.projectId,
    this.packageId,
    this.quantity,
  });

  factory Investment.fromJson(Map<String, dynamic> json) {
    return _$InvestmentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvestmentToJson(this);

  Investment copyWith({
    String? id,
    String? investorId,
    num? totalPrice,
    String? status,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    String? investorName,
    String? investorImage,
    String? investorEmail,
    String? packageName,
    num? packagePrice,
    String? projectName,
    String? projectId,
    String? packageId,
    num? quantity,
  }) {
    return Investment(
      id: id ?? this.id,
      investorId: investorId ?? this.investorId,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      investorName: investorName ?? this.investorName,
      investorImage: investorImage ?? this.investorImage,
      investorEmail: investorEmail ?? this.investorEmail,
      packageName: packageName ?? this.packageName,
      packagePrice: packagePrice ?? this.packagePrice,
      projectName: projectName ?? this.projectName,
      projectId: projectId ?? this.projectId,
      packageId: packageId ?? this.packageId,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      investorId,
      totalPrice,
      status,
      createDate,
      createBy,
      updateDate,
      updateBy,
      investorName,
      investorImage,
      investorEmail,
      packageName,
      packagePrice,
      projectName,
      projectId,
      packageId,
      quantity,
    ];
  }
}
