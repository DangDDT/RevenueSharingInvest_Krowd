import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stage.g.dart';

@JsonSerializable()
class Stage extends Equatable {
  final String? id;
  final String? projectId;
  final dynamic description;
  final String? startDate;
  final String? endDate;
  final String? status;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final bool? isDeleted;
  final double? pessimisticExpectedAmount;
  final double? normalExpectedAmount;
  final double? optimisticExpectedAmount;
  final double? pessimisticExpectedRatio;
  final double? normalExpectedRatio;
  final double? optimisticExpectedRatio;
  final String? name;

  const Stage({
    this.id,
    this.projectId,
    this.description,
    this.startDate,
    this.endDate,
    this.status,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
    this.pessimisticExpectedAmount,
    this.normalExpectedAmount,
    this.optimisticExpectedAmount,
    this.pessimisticExpectedRatio,
    this.normalExpectedRatio,
    this.optimisticExpectedRatio,
    this.name,
  });

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);

  Map<String, dynamic> toJson() => _$StageToJson(this);

  Stage copyWith({
    String? id,
    String? projectId,
    dynamic description,
    String? startDate,
    String? endDate,
    String? status,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    bool? isDeleted,
    double? pessimisticExpectedAmount,
    double? normalExpectedAmount,
    double? optimisticExpectedAmount,
    double? pessimisticExpectedRatio,
    double? normalExpectedRatio,
    double? optimisticExpectedRatio,
    String? name,
  }) {
    return Stage(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      isDeleted: isDeleted ?? this.isDeleted,
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
      createDate,
      createBy,
      updateDate,
      updateBy,
      isDeleted,
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
