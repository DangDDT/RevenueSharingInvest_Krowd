import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stage_return.g.dart';

@JsonSerializable()
class StageReturn extends Equatable {
  final String? id;
  final String? projectId;
  final dynamic description;
  final String? startDate;
  final String? endDate;
  final String? status;
  final dynamic isOverDue;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final dynamic updateBy;
  final num? actualAmount;
  final num? sharedAmount;
  final num? paidAmount;
  final num? receivedAmount;
  final num? pessimisticExpectedAmount;
  final num? normalExpectedAmount;
  final num? optimisticExpectedAmount;
  final num? pessimisticExpectedRatio;
  final num? normalExpectedRatio;
  final num? optimisticExpectedRatio;
  final String? name;

  const StageReturn({
    this.id,
    this.projectId,
    this.description,
    this.startDate,
    this.endDate,
    this.status,
    this.isOverDue,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.actualAmount,
    this.sharedAmount,
    this.paidAmount,
    this.receivedAmount,
    this.pessimisticExpectedAmount,
    this.normalExpectedAmount,
    this.optimisticExpectedAmount,
    this.pessimisticExpectedRatio,
    this.normalExpectedRatio,
    this.optimisticExpectedRatio,
    this.name,
  });

  factory StageReturn.fromJson(Map<String, dynamic> json) {
    return _$StageReturnFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StageReturnToJson(this);

  StageReturn copyWith({
    String? id,
    String? projectId,
    dynamic description,
    String? startDate,
    String? endDate,
    String? status,
    dynamic isOverDue,
    String? createDate,
    String? createBy,
    String? updateDate,
    dynamic updateBy,
    num? actualAmount,
    num? sharedAmount,
    num? paidAmount,
    num? receivedAmount,
    num? pessimisticExpectedAmount,
    num? normalExpectedAmount,
    num? optimisticExpectedAmount,
    num? pessimisticExpectedRatio,
    num? normalExpectedRatio,
    num? optimisticExpectedRatio,
    String? name,
  }) {
    return StageReturn(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      isOverDue: isOverDue ?? this.isOverDue,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      actualAmount: actualAmount ?? this.actualAmount,
      sharedAmount: sharedAmount ?? this.sharedAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      receivedAmount: receivedAmount?? this.receivedAmount,
      pessimisticExpectedAmount:
          pessimisticExpectedAmount ?? this.pessimisticExpectedAmount,
      normalExpectedAmount: normalExpectedAmount ?? this.normalExpectedAmount,
      optimisticExpectedAmount:
          optimisticExpectedAmount ?? this.optimisticExpectedAmount,
      pessimisticExpectedRatio:
          pessimisticExpectedRatio ?? this.pessimisticExpectedRatio,
      normalExpectedRatio: normalExpectedRatio ?? this.normalExpectedRatio,
      optimisticExpectedRatio:
          optimisticExpectedRatio ?? this.optimisticExpectedRatio,
      name: name ?? this.name,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      projectId,
      description,
      startDate,
      endDate,
      status,
      isOverDue,
      createDate,
      createBy,
      updateDate,
      updateBy,
      actualAmount,
      sharedAmount,
      paidAmount,
      receivedAmount,
      pessimisticExpectedAmount,
      normalExpectedAmount,
      optimisticExpectedAmount,
      pessimisticExpectedRatio,
      normalExpectedRatio,
      optimisticExpectedRatio,
      name,
    ];
  }
}
