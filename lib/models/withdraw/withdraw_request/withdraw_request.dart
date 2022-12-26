import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdraw_request.g.dart';

@JsonSerializable()
class WithdrawRequest extends Equatable {
  final String id;
  final String bankName;
  final String accountName;
  final String bankAccount;
  final String description;
  final num amount;
  final String status;
  final dynamic refusalReason;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final String? fromWalletId;
  final String? fromWalletName;
  final String? reportMessage;

  const WithdrawRequest({
    required this.id,
    required this.bankName,
    required this.accountName,
    required this.bankAccount,
    required this.description,
    required this.amount,
    required this.status,
    required this.refusalReason,
    required this.createDate,
    required this.createBy,
    required this.updateDate,
    required this.updateBy,
    required this.fromWalletId,
    required this.fromWalletName,
    required this.reportMessage,
  });

  factory WithdrawRequest.fromJson(Map<String, dynamic> json) {
    return _$WithdrawRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WithdrawRequestToJson(this);

  WithdrawRequest copyWith({
    String? id,
    String? bankName,
    String? accountName,
    String? bankAccount,
    String? description,
    num? amount,
    String? status,
    dynamic refusalReason,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    String? fromWalletId,
    String? fromWalletName,
    String? reportMessage,
  }) {
    return WithdrawRequest(
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
      fromWalletName: fromWalletName ?? this.fromWalletName,
      reportMessage: reportMessage ?? this.reportMessage,
    );
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
      fromWalletId,
      fromWalletName,
    ];
  }
}
