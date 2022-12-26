import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_transaction.g.dart';

@JsonSerializable()
class WalletTransaction extends Equatable {
  final String? id;
  final dynamic userId;
  final String? paymentId;
  final dynamic systemWalletId;
  final dynamic projectWalletId;
  final dynamic investorWalletId;
  final double? amount;
  final String? description;
  final String? type;
  final String? fromWalletId;
  final String? toWalletId;
  final double? fee;
  final String? createDate;
  final String? createBy;

  const WalletTransaction({
    this.id,
    this.userId,
    this.paymentId,
    this.systemWalletId,
    this.projectWalletId,
    this.investorWalletId,
    this.amount,
    this.description,
    this.type,
    this.fromWalletId,
    this.toWalletId,
    this.fee,
    this.createDate,
    this.createBy,
  });

  factory WalletTransaction.fromJson(Map<String, dynamic> json) {
    return _$WalletTransactionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WalletTransactionToJson(this);

  WalletTransaction copyWith({
    String? id,
    dynamic userId,
    String? paymentId,
    dynamic systemWalletId,
    dynamic projectWalletId,
    dynamic investorWalletId,
    double? amount,
    String? description,
    String? type,
    String? fromWalletId,
    String? toWalletId,
    double? fee,
    String? createDate,
    String? createBy,
  }) {
    return WalletTransaction(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      paymentId: paymentId ?? this.paymentId,
      systemWalletId: systemWalletId ?? this.systemWalletId,
      projectWalletId: projectWalletId ?? this.projectWalletId,
      investorWalletId: investorWalletId ?? this.investorWalletId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      type: type ?? this.type,
      fromWalletId: fromWalletId ?? this.fromWalletId,
      toWalletId: toWalletId ?? this.toWalletId,
      fee: fee ?? this.fee,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      paymentId,
      systemWalletId,
      projectWalletId,
      investorWalletId,
      amount,
      description,
      type,
      fromWalletId,
      toWalletId,
      fee,
      createDate,
      createBy,
    ];
  }
}
