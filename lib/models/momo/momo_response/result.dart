import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result extends Equatable {
  final String? partnerCode;
  final String? requestId;
  final String? orderId;
  final num? amount;
  final num? responseTime;
  final String? message;
  final num? resultCode;
  final String? payUrl;
  final String? deeplink;
  final dynamic qrCodeUrl;
  final dynamic deeplinkMiniApp;
  final String? partnerClientId;

  const Result({
    this.partnerCode,
    this.requestId,
    this.orderId,
    this.amount,
    this.responseTime,
    this.message,
    this.resultCode,
    this.payUrl,
    this.deeplink,
    this.qrCodeUrl,
    this.deeplinkMiniApp,
    this.partnerClientId,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      partnerCode,
      requestId,
      orderId,
      amount,
      responseTime,
      message,
      resultCode,
      payUrl,
      deeplink,
      qrCodeUrl,
      deeplinkMiniApp,
      partnerClientId,
    ];
  }
}
