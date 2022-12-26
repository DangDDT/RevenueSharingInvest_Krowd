import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/resources/repository.dart';

import '../../../models/field/field.dart';

part 'field_state.dart';

class FieldCubit extends Cubit<FieldState> {
  final Repository repository = new Repository();
  FieldCubit()
      : super(
          const FieldState(
            fields: [],
            selectedField: Field(
              id: "0000",
              name: "Tất cả",
              description: "",
            ),
          ),
        );

  Future<void> fetchFields() async {
    emit(state.copyWith(status: FieldStatus.loading));
    try {
      // ignore: non_constant_identifier_names
      final tuple2_numOfField_listOfField = await repository.fetchFields();
      final numOfField = tuple2_numOfField_listOfField.item1;
      final listOfField = [
        new Field(
          id: "0000",
          name: "Tất cả",
          description: "",
        ),
        ...tuple2_numOfField_listOfField.item2 ?? List<Field>.empty()
      ];
      emit(
        state.copyWith(
          status: FieldStatus.success,
          numOfField: numOfField,
          fields: listOfField,
          selectedField: listOfField.elementAt(0),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FieldStatus.failure));
    }
  }

  Future<void> onChangeSelectedFields(Field field) async {
    emit(state.copyWith(selectedField: field));
  }
}
