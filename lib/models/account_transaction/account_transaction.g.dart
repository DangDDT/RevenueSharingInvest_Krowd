// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountTransaction _$AccountTransactionFromJson(Map<String, dynamic> json) =>
    AccountTransaction(
      id: json['id'] as String?,
      fromUserId: json['fromUserId'] as String?,
      partnerClientId: json['partnerClientId'] as String?,
      amount: json['amount'] as String?,
      orderType: json['orderType'] as String?,
      message: json['message'] as String?,
      orderId: json['orderId'] as String?,
      partnerCode: json['partnerCode'] as String?,
      payType: json['payType'] as String?,
      signature: json['signature'] as String?,
      requestId: json['requestId'] as String?,
      responsetime: json['responsetime'] as String?,
      resultCode: json['resultCode'] as String?,
      extraData: json['extraData'] as String?,
      orderInfo: json['orderInfo'] as String?,
      transId: json['transId'] as String?,
      createDate: json['createDate'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AccountTransactionToJson(AccountTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fromUserId': instance.fromUserId,
      'partnerClientId': instance.partnerClientId,
      'amount': instance.amount,
      'orderType': instance.orderType,
      'message': instance.message,
      'orderId': instance.orderId,
      'partnerCode': instance.partnerCode,
      'payType': instance.payType,
      'signature': instance.signature,
      'requestId': instance.requestId,
      'responsetime': instance.responsetime,
      'resultCode': instance.resultCode,
      'extraData': instance.extraData,
      'orderInfo': instance.orderInfo,
      'transId': instance.transId,
      'createDate': instance.createDate,
      'type': instance.type,
    };
