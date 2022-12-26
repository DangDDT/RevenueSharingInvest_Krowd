import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_type.g.dart';

@JsonSerializable()
class WalletType extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? mode;
  final String? type;

  const WalletType({
    this.id,
    this.name,
    this.description,
    this.mode,
    this.type,
  });

  factory WalletType.fromJson(Map<String, dynamic> json) {
    return _$WalletTypeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WalletTypeToJson(this);

  WalletType copyWith({
    String? id,
    String? name,
    String? description,
    String? mode,
    String? type,
  }) {
    return WalletType(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      mode: mode ?? this.mode,
      type: type ?? this.type,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, description, mode, type];
}
