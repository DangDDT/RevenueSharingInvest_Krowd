import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdraw_request_post.g.dart';

@JsonSerializable()
class WithdrawRequestPost extends Equatable {
  final String fromWalletId;
  final String bankName;
  final String accountName;
  final String bankAccount;
  final num amount;

  const WithdrawRequestPost({
    required this.fromWalletId,
    required this.bankName,
    required this.accountName,
    required this.bankAccount,
    required this.amount,
  });

  factory WithdrawRequestPost.fromJson(Map<String, dynamic> json) {
    return _$WithdrawRequestPostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WithdrawRequestPostToJson(this);

  WithdrawRequestPost copyWith({
    String? fromWalletId,
    String? bankName,
    String? accountName,
    String? bankAccount,
    num? amount,
  }) {
    return WithdrawRequestPost(
      fromWalletId: fromWalletId ?? this.fromWalletId,
      bankName: bankName ?? this.bankName,
      accountName: accountName ?? this.accountName,
      bankAccount: bankAccount ?? this.bankAccount,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      fromWalletId,
      bankName,
      accountName,
      bankAccount,
      amount,
    ];
  }
}
