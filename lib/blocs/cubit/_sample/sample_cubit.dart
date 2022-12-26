import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/resources/repository.dart';

part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> {
  final Repository repository = new Repository();
  SampleCubit() : super(const SampleState());
}
