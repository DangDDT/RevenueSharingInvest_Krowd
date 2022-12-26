import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member_list.g.dart';

@JsonSerializable()
class Member extends Equatable {
  final dynamic image;
  final dynamic investDate;
  final String? lastName;
  final String? firstName;

  const Member({
    this.image,
    this.investDate,
    this.lastName,
    this.firstName,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return _$MemberFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MemberToJson(this);

  Member copyWith({
    dynamic image,
    dynamic investDate,
    String? lastName,
    String? firstName,
  }) {
    return Member(
      image: image ?? this.image,
      investDate: investDate ?? this.investDate,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [image, investDate, lastName, firstName];
}
