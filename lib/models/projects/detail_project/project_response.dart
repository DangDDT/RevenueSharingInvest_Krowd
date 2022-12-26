import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'project.dart';

part 'project_response.g.dart';

@JsonSerializable()
class ProjectResponse extends Equatable {
  final num? numOfProject;
  final List<ProjectDetail>? listOfProject;

  const ProjectResponse({this.numOfProject, this.listOfProject});

  factory ProjectResponse.fromJson(Map<String, dynamic> json) {
    return _$ProjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProjectResponseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [numOfProject, listOfProject];
}
