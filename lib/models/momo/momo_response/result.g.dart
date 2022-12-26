// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      partnerCode: json['partnerCode'] as String?,
      requestId: json['requestId'] as String?,
      orderId: json['orderId'] as String?,
      amount: json['amount'] as num?,
      responseTime: json['responseTime'] as num?,
      message: json['message'] as String?,
      resultCode: json['resultCode'] as num?,
      payUrl: json['payUrl'] as String?,
      deeplink: json['deeplink'] as String?,
      qrCodeUrl: json['qrCodeUrl'],
      deeplinkMiniApp: json['deeplinkMiniApp'],
      partnerClientId: json['partnerClientId'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'partnerCode': instance.partnerCode,
      'requestId': instance.requestId,
      'orderId': instance.orderId,
      'amount': instance.amount,
      'responseTime': instance.responseTime,
      'message': instance.message,
      'resultCode': instance.resultCode,
      'payUrl': instance.payUrl,
      'deeplink': instance.deeplink,
      'qrCodeUrl': instance.qrCodeUrl,
      'deeplinkMiniApp': instance.deeplinkMiniApp,
      'partnerClientId': instance.partnerClientId,
    };
