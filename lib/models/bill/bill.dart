import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill extends Equatable {
  final String? id;
  final String? dailyReportId;
  final String? invoiceId;
  final double? amount;
  final String? description;
  final String? createBy;
  final String? createDate;

  const Bill({
    this.id,
    this.dailyReportId,
    this.invoiceId,
    this.amount,
    this.description,
    this.createBy,
    this.createDate,
  });

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);

  Bill copyWith({
    String? id,
    String? dailyReportId,
    String? invoiceId,
    double? amount,
    String? description,
    String? createBy,
    String? createDate,
  }) {
    return Bill(
      id: id ?? this.id,
      dailyReportId: dailyReportId ?? this.dailyReportId,
      invoiceId: invoiceId ?? this.invoiceId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      createBy: createBy ?? this.createBy,
      createDate: createDate ?? this.createDate,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      dailyReportId,
      invoiceId,
      amount,
      description,
      createBy,
      createDate,
    ];
  }
}
