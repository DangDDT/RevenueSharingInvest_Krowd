import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'field.g.dart';

@JsonSerializable()
class Field extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final bool? isDeleted;

  const Field({
    this.id,
    this.name,
    this.description,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
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
    bool? isDeleted,
  }) {
    return Field(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      isDeleted: isDeleted ?? this.isDeleted,
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
      isDeleted,
    ];
  }
}
