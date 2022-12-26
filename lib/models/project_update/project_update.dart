import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_update.g.dart';

@JsonSerializable()
class ProjectUpdate extends Equatable {
  final String? id;
  final num? priority;
  final String? projectId;
  final String? createDate;
  final String? createBy;
  final String? updateDate;
  final String? updateBy;
  final String? title;
  final dynamic link;
  final String? content;
  final dynamic description;

  const ProjectUpdate({
    this.id,
    this.priority,
    this.projectId,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.title,
    this.link,
    this.content,
    this.description,
  });

  factory ProjectUpdate.fromJson(Map<String, dynamic> json) {
    return _$ProjectUpdateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProjectUpdateToJson(this);

  ProjectUpdate copyWith({
    String? id,
    num? priority,
    String? projectId,
    String? createDate,
    String? createBy,
    String? updateDate,
    String? updateBy,
    String? title,
    dynamic link,
    String? content,
    dynamic description,
  }) {
    return ProjectUpdate(
      id: id ?? this.id,
      priority: priority ?? this.priority,
      projectId: projectId ?? this.projectId,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      title: title ?? this.title,
      link: link ?? this.link,
      content: content ?? this.content,
      description: description ?? this.description,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      priority,
      projectId,
      createDate,
      createBy,
      updateDate,
      updateBy,
      title,
      link,
      content,
      description,
    ];
  }
}
