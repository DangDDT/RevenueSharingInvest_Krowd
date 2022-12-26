import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_wallet_response.g.dart';

@JsonSerializable()
class TransferWalletResponse extends Equatable {
  final String? fromWalletId;
  final String? fromWalletName;
  final String? fromWalletType;
  final String? toWalletId;
  final String? toWalletName;
  final String? toWalletType;
  final num? amount;

  const TransferWalletResponse({
    this.fromWalletId,
    this.fromWalletName,
    this.fromWalletType,
    this.toWalletId,
    this.toWalletName,
    this.toWalletType,
    this.amount,
  });

  factory TransferWalletResponse.fromJson(Map<String, dynamic> json) {
    return _$TransferWalletResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransferWalletResponseToJson(this);

  TransferWalletResponse copyWith({
    String? fromWalletId,
    String? fromWalletName,
    String? fromWalletType,
    String? toWalletId,
    String? toWalletName,
    String? toWalletType,
    num? amount,
  }) {
    return TransferWalletResponse(
      fromWalletId: fromWalletId ?? this.fromWalletId,
      fromWalletName: fromWalletName ?? this.fromWalletName,
      fromWalletType: fromWalletType ?? this.fromWalletType,
      toWalletId: toWalletId ?? this.toWalletId,
      toWalletName: toWalletName ?? this.toWalletName,
      toWalletType: toWalletType ?? this.toWalletType,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      fromWalletId,
      fromWalletName,
      fromWalletType,
      toWalletId,
      toWalletName,
      toWalletType,
      amount,
    ];
  }
}
