part of 'field_cubit.dart';

enum FieldStatus {
  initial,
  loading,
  success,
  failure,
}

class FieldState extends Equatable {
  final FieldStatus status;
  final num numOfField;
  final List<Field> fields;
  final Field selectedField;
  const FieldState({
    this.status = FieldStatus.initial,
    this.numOfField = 0,
    required this.fields,
    required this.selectedField,
  });
  FieldState copyWith({
    FieldStatus? status,
    num? numOfField,
    List<Field>? fields,
    Field? selectedField,
  }) {
    return FieldState(
      status: status ?? this.status,
      numOfField: numOfField ?? this.numOfField,
      fields: fields ?? this.fields,
      selectedField: selectedField ?? this.selectedField,
    );
  }

  @override
  List<Object?> get props => [status, numOfField, fields, selectedField];
}
