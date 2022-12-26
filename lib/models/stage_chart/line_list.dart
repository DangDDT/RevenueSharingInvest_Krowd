import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'line_list.g.dart';

@JsonSerializable()
class Line extends Equatable {
  final String? name;
  final List<int>? data;

  Line({this.name, this.data});

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);

  Map<String, dynamic> toJson() => _$LineToJson(this);
  Line copyWith({String? name, List<int>? data}) {
    return Line(
      name: name ?? this.name,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props {
    return [
      name,
      data,
    ];
  }
}
