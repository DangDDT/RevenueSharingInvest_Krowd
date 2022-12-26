import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'field.g.dart';

@JsonSerializable()
class Field extends Equatable {
  final String id;
  final String name;
  final String description;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;

  const Field({
    required this.id,
    required this.name,
    required this.description,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
  });

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);

  Map<String, dynamic> toJson() => _$FieldToJson(this);

  Field copyWith({
    String? id,
    String? name,
    String? description,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
  }) {
    return Field(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      createDate,
      createBy,
      updateDate,
      updateBy,
    ];
  }
}
