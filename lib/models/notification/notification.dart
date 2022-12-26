import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification extends Equatable {
  final String? title;
  final String? entityId;
  final String? image;
  final String? createDate;
  final bool? seen;

  const Notification({
    this.title,
    this.entityId,
    this.image,
    this.createDate,
    this.seen,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return _$NotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  Notification copyWith({
    String? title,
    String? entityId,
    String? image,
    String? createDate,
    bool? seen,
  }) {
    return Notification(
      title: title ?? this.title,
      entityId: entityId ?? this.entityId,
      image: image ?? this.image,
      createDate: createDate ?? this.createDate,
      seen: seen ?? this.seen,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [title, entityId, image, createDate, seen];
}
