import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable()
class Area extends Equatable {
  final String? id;
  final String? city;
  final String? district;
  final String? createDate;
  final dynamic createBy;
  final String? updateDate;
  final dynamic updateBy;
  final bool? isDeleted;

  const Area({
    this.id,
    this.city,
    this.district,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);

  Area copyWith({
    String? id,
    String? city,
    String? district,
    String? createDate,
    dynamic createBy,
    String? updateDate,
    dynamic updateBy,
    bool? isDeleted,
  }) {
    return Area(
      id: id ?? this.id,
      city: city ?? this.city,
      district: district ?? this.district,
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
      city,
      district,
      createDate,
      createBy,
      updateDate,
      updateBy,
      isDeleted,
    ];
  }
}
