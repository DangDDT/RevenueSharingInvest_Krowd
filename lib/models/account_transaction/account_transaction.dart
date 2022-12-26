import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_transaction.g.dart';

@JsonSerializable()
class AccountTransaction extends Equatable {
  final String? id;
  final String? fromUserId;
  final String? partnerClientId;
  final String? amount;
  final String? orderType;
  final String? message;
  final String? orderId;
  final String? partnerCode;
  final String? payType;
  final String? signature;
  final String? requestId;
  final String? responsetime;
  final String? resultCode;
  final String? extraData;
  final String? orderInfo;
  final String? transId;
  final String? createDate;
  final String? type;

  const AccountTransaction({
    this.id,
    this.fromUserId,
    this.partnerClientId,
    this.amount,
    this.orderType,
    this.message,
    this.orderId,
    this.partnerCode,
    this.payType,
    this.signature,
    this.requestId,
    this.responsetime,
    this.resultCode,
    this.extraData,
    this.orderInfo,
    this.transId,
    this.createDate,
    this.type,
  });

  factory AccountTransaction.fromJson(Map<String, dynamic> json) {
    return _$AccountTransactionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AccountTransactionToJson(this);

  AccountTransaction copyWith({
    String? id,
    String? fromUserId,
    String? partnerClientId,
    String? amount,
    String? orderType,
    String? message,
    String? orderId,
    String? partnerCode,
    String? payType,
    String? signature,
    String? requestId,
    String? responsetime,
    String? resultCode,
    String? extraData,
    String? orderInfo,
    String? transId,
    String? createDate,
    String? type,
  }) {
    return AccountTransaction(
      id: id ?? this.id,
      fromUserId: fromUserId ?? this.fromUserId,
      partnerClientId: partnerClientId ?? this.partnerClientId,
      amount: amount ?? this.amount,
      orderType: orderType ?? this.orderType,
      message: message ?? this.message,
      orderId: orderId ?? this.orderId,
      partnerCode: partnerCode ?? this.partnerCode,
      payType: payType ?? this.payType,
      signature: signature ?? this.signature,
      requestId: requestId ?? this.requestId,
      responsetime: responsetime ?? this.responsetime,
      resultCode: resultCode ?? this.resultCode,
      extraData: extraData ?? this.extraData,
      orderInfo: orderInfo ?? this.orderInfo,
      transId: transId ?? this.transId,
      createDate: createDate ?? this.createDate,
      type: type ?? this.type,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      fromUserId,
      partnerClientId,
      amount,
      orderType,
      message,
      orderId,
      partnerCode,
      payType,
      signature,
      requestId,
      responsetime,
      resultCode,
      extraData,
      orderInfo,
      transId,
      createDate,
      type,
    ];
  }
}
