import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class Payment extends Equatable {
  final String? projectId;
  final String? projectName;
  final String? stageId;
  final String? stageName;
  final String? fromWalletName;
  final num? fee;
  final String? id;
  final String? periodRevenueId;
  final String? investmentId;
  final num amount;
  final String? description;
  final String? type;
  final String? fromId;
  final String? toId;
  final String? createDate;
  final String? createBy;
  final String? status;

  const Payment({
    this.projectId,
    this.projectName,
    this.stageId,
    this.stageName,
    this.fromWalletName,
    this.fee,
    this.id,
    this.periodRevenueId,
    this.investmentId,
    this.amount = 0,
    this.description,
    this.type,
    this.fromId,
    this.toId,
    this.createDate,
    this.createBy,
    this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return _$PaymentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  Payment copyWith({
    String? projectId,
    String? projectName,
    String? stageId,
    String? stageName,
    String? fromWalletName,
    num? fee,
    String? id,
    String? periodRevenueId,
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
    return Payment(
      projectId: projectId ?? this.projectId,
      projectName: projectName ?? this.projectName,
      stageId: stageId ?? this.stageId,
      stageName: stageName ?? this.stageName,
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
      stageId,
      stageName,
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
