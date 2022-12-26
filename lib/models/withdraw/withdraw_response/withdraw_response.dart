import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdraw_response.g.dart';

@JsonSerializable()
class WithdrawResponse extends Equatable {
  final String? id;
  final String? bankName;
  final String? accountName;
  final String? bankAccount;
  final String? description;
  final num? amount;
  final String? status;
  final dynamic refusalReason;
  final String? createDate;
  final String? createBy;
  final dynamic updateDate;
  final dynamic updateBy;
  final String fromWalletId;
  final String fromWalletName;
  const WithdrawResponse({
    this.id,
    this.bankName,
    this.accountName,
    this.bankAccount,
    this.description,
    this.amount,
    this.status,
    this.refusalReason,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    required this.fromWalletId,
    required this.fromWalletName,
  });

  factory WithdrawResponse.fromJson(Map<String, dynamic> json) {
    return _$WithdrawResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WithdrawResponseToJson(this);

  WithdrawResponse copyWith(
      {String? id,
      String? bankName,
      String? accountName,
      String? bankAccount,
      String? description,
      num? amount,
      String? status,
      dynamic refusalReason,
      String? createDate,
      String? createBy,
      dynamic updateDate,
      dynamic updateBy,
      String? fromWalletId,
      String? fromWalletName}) {
    return WithdrawResponse(
        id: id ?? this.id,
        bankName: bankName ?? this.bankName,
        accountName: accountName ?? this.accountName,
        bankAccount: bankAccount ?? this.bankAccount,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        refusalReason: refusalReason ?? this.refusalReason,
        createDate: createDate ?? this.createDate,
        createBy: createBy ?? this.createBy,
        updateDate: updateDate ?? this.updateDate,
        updateBy: updateBy ?? this.updateBy,
        fromWalletId: fromWalletId ?? this.fromWalletId,
        fromWalletName: fromWalletName ?? this.fromWalletName);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      bankName,
      accountName,
      bankAccount,
      description,
      amount,
      status,
      refusalReason,
      createDate,
      createBy,
      updateDate,
      updateBy,
    ];
  }
}
