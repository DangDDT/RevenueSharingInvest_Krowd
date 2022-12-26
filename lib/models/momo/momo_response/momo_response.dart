import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'momo_response.g.dart';

@JsonSerializable()
class MomoResponse extends Equatable {
  final Result? result;
  final num? id;
  final dynamic exception;
  final num? status;
  final bool? isCanceled;
  final bool? isCompleted;
  final bool? isCompletedSuccessfully;
  final num? creationOptions;
  final dynamic asyncState;
  final bool? isFaulted;

  const MomoResponse({
    this.result,
    this.id,
    this.exception,
    this.status,
    this.isCanceled,
    this.isCompleted,
    this.isCompletedSuccessfully,
    this.creationOptions,
    this.asyncState,
    this.isFaulted,
  });

  factory MomoResponse.fromJson(Map<String, dynamic> json) {
    return _$MomoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MomoResponseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      result,
      id,
      exception,
      status,
      isCanceled,
      isCompleted,
      isCompletedSuccessfully,
      creationOptions,
      asyncState,
      isFaulted,
    ];
  }
}
