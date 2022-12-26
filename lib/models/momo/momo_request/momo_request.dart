import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'momo_request.g.dart';

@JsonSerializable()
class MomoRequest extends Equatable {
  final num amount;

  const MomoRequest({
    required this.amount,
  });

  factory MomoRequest.fromJson(Map<String, dynamic> json) {
    return _$MomoRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MomoRequestToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      amount,
    ];
  }
}
