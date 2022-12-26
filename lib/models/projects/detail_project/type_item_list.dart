import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'type_item_list.g.dart';

@JsonSerializable()
class TypeItemList extends Equatable {
  final String? id;
  final int? priority;
  final String? title;
  final dynamic link;
  final String? content;
  final dynamic description;

  const TypeItemList({
    this.id,
    this.priority,
    this.title,
    this.link,
    this.content,
    this.description,
  });

  factory TypeItemList.fromJson(Map<String, dynamic> json) {
    return _$TypeItemListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TypeItemListToJson(this);

  TypeItemList copyWith({
    String? id,
    int? priority,
    String? title,
    dynamic link,
    String? content,
    dynamic description,
  }) {
    return TypeItemList(
      id: id ?? this.id,
      priority: priority ?? this.priority,
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
      title,
      link,
      content,
      description,
    ];
  }
}
