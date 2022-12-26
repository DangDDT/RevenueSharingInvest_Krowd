import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'wallet_type.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet extends Equatable {
  final WalletType? walletType;
  final String id;
  final String? investorId;
  final double? balance;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final bool? isDeleted;

  const Wallet({
    this.walletType,
    required this.id,
    this.investorId,
    this.balance,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
  });
  factory Wallet.fromJson(Map<String, dynamic> json) {
    return _$WalletFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WalletToJson(this);
  Wallet copyWith({
    WalletType? walletType,
    String? id,
    String? investorId,
    double? balance,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    bool? isDeleted,
  }) {
    return Wallet(
      walletType: walletType ?? this.walletType,
      id: id ?? this.id,
      investorId: investorId ?? this.investorId,
      balance: balance ?? this.balance,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      walletType,
      id,
      investorId,
      balance,
      createDate,
      createBy,
      updateDate,
      updateBy,
      isDeleted,
    ];
  }
}
