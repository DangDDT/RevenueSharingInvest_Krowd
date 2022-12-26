import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investment_response_post.g.dart';

@JsonSerializable()
class InvestmentResponsePost extends Equatable {
  final String? projectId;
  final String? projectName;
  final String? packageId;
  final String? packageName;
  final num? investedQuantity;
  final String? fromWalletName;
  final String? fee;
  final String? id;
  final dynamic periodRevenueId;
  final String? investmentId;
  final num? amount;
  final String? description;
  final String? type;
  final String? fromId;
  final String? toId;
  final String? createDate;
  final String? createBy;
  final String? status;

  const InvestmentResponsePost({
    this.projectId,
    this.projectName,
    this.packageId,
    this.packageName,
    this.investedQuantity,
    this.fromWalletName,
    this.fee,
    this.id,
    this.periodRevenueId,
    this.investmentId,
    this.amount,
    this.description,
    this.type,
    this.fromId,
    this.toId,
    this.createDate,
    this.createBy,
    this.status,
  });

  factory InvestmentResponsePost.fromJson(Map<String, dynamic> json) {
    return _$InvestmentResponsePostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvestmentResponsePostToJson(this);

  InvestmentResponsePost copyWith({
    String? projectId,
    String? projectName,
    String? packageId,
    String? packageName,
    num? investedQuantity,
    String? fromWalletName,
    String? fee,
    String? id,
    dynamic periodRevenueId,
    String? investmentId,
    num? amount,
    String? description,
    String? type,
    String? fromId,
    String? toId,
    String? createDate,
    String? createBy,
    String? status,
  }) {
    return InvestmentResponsePost(
      projectId: projectId ?? this.projectId,
      projectName: projectName ?? this.projectName,
      packageId: packageId ?? this.packageId,
      packageName: packageName ?? this.packageName,
      investedQuantity: investedQuantity ?? this.investedQuantity,
      fromWalletName: fromWalletName ?? this.fromWalletName,
      fee: fee ?? this.fee,
      id: id ?? this.id,
      periodRevenueId: periodRevenueId ?? this.periodRevenueId,
      investmentId: investmentId ?? this.investmentId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      type: type ?? this.type,
      fromId: fromId ?? this.fromId,
      toId: toId ?? this.toId,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      projectId,
      projectName,
      packageId,
      packageName,
      investedQuantity,
      fromWalletName,
      fee,
      id,
      periodRevenueId,
      investmentId,
      amount,
      description,
      type,
      fromId,
      toId,
      createDate,
      createBy,
      status,
    ];
  }
}
