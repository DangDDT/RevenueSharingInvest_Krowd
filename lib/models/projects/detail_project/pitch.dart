import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pitch.g.dart';

@JsonSerializable()
class Pitch extends Equatable {
  final String? id;
  final num? priority;
  final String? projectId;
  final String? createDate;
  final dynamic createBy;
  final String? updateDate;
  final dynamic updateBy;
  final bool? isDeleted;
  final String? title;
  final dynamic link;
  final String? content;
  final dynamic description;

  const Pitch({
    this.id,
    this.priority,
    this.projectId,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.isDeleted,
    this.title,
    this.link,
    this.content,
    this.description,
  });

  factory Pitch.fromJson(Map<String, dynamic> json) => _$PitchFromJson(json);

  Map<String, dynamic> toJson() => _$PitchToJson(this);

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
      isDeleted,
      title,
      link,
      content,
      description,
    ];
  }
}
