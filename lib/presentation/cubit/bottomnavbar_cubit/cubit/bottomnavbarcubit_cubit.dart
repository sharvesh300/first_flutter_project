import 'package:bloc/bloc.dart';

part 'bottomnavbarcubit_state.dart';

class BottomnavbarcubitCubit extends Cubit<BottomnavbarcubitState> {
  BottomnavbarcubitCubit() : super(BottomnavbarcubitState(page: 0));

  void update({required int page}) {
    emit(state.copyWith(page: page));
  }
}
