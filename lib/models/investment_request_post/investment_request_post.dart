import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investment_request_post.g.dart';

@JsonSerializable()
class InvestmentRequestPost extends Equatable {
  final String projectId;
  final String packageId;
  final num quantity;

  const InvestmentRequestPost({
    required this.projectId,
    required this.packageId,
    required this.quantity,
  });

  factory InvestmentRequestPost.fromJson(Map<String, dynamic> json) {
    return _$InvestmentRequestPostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvestmentRequestPostToJson(this);

  InvestmentRequestPost copyWith({
    String? projectId,
    String? packageId,
    int? quantity,
  }) {
    return InvestmentRequestPost(
      projectId: projectId ?? this.projectId,
      packageId: packageId ?? this.packageId,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [projectId, packageId, quantity];
}
