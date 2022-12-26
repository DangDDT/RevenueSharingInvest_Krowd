import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package.g.dart';

@JsonSerializable()
class Package extends Equatable {
  final String id;
  final List<String> descriptionList;
  final num remainingQuantity;
  final String? status;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final String name;
  final num price;
  final dynamic image;
  final num quantity;

  const Package({
    required this.id,
    required this.descriptionList,
    required this.remainingQuantity,
    this.status,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    required this.name,
    required this.price,
    this.image,
    required this.quantity,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return _$PackageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PackageToJson(this);

  Package copyWith({
    String? id,
    List<String>? descriptionList,
    num? remainingQuantity,
    String? status,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    String? name,
    num? price,
    dynamic image,
    num? quantity,
  }) {
    return Package(
      id: id ?? this.id,
      descriptionList: descriptionList ?? this.descriptionList,
      remainingQuantity: remainingQuantity ?? this.remainingQuantity,
      status: status ?? this.status,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      descriptionList,
      remainingQuantity,
      status,
      createDate,
      createBy,
      updateDate,
      updateBy,
      name,
      price,
      image,
      quantity,
    ];
  }
}
