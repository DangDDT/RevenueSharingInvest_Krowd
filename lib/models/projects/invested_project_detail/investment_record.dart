import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investment_record.g.dart';

@JsonSerializable()
class InvestmentRecord extends Equatable {
  final String? packageName;
  final num? quantity;
  final num? totalPrice;
  final String? createDate;

  const InvestmentRecord({
    this.packageName,
    this.quantity,
    this.totalPrice,
    this.createDate,
  });

  factory InvestmentRecord.fromJson(Map<String, dynamic> json) {
    return _$InvestmentRecordFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvestmentRecordToJson(this);

  InvestmentRecord copyWith({
    String? packageName,
    num? quantity,
    num? totalPrice,
    String? createDate,
  }) {
    return InvestmentRecord(
      packageName: packageName ?? this.packageName,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
      createDate: createDate ?? this.createDate,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      packageName,
      quantity,
      totalPrice,
      createDate,
    ];
  }
}
