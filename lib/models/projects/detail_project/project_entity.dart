import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'type_item_list.dart';

part 'project_entity.g.dart';

@JsonSerializable()
class ProjectEntity extends Equatable {
  final String? type;
  final List<TypeItemList>? typeItemList;

  const ProjectEntity({this.type, this.typeItemList});

  factory ProjectEntity.fromJson(Map<String, dynamic> json) {
    return _$ProjectEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProjectEntityToJson(this);

  ProjectEntity copyWith({
    String? type,
    List<TypeItemList>? typeItemList,
  }) {
    return ProjectEntity(
      type: type ?? this.type,
      typeItemList: typeItemList ?? this.typeItemList,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [type, typeItemList];
}
