part of 'bottomnavbarcubit_cubit.dart';

class BottomnavbarcubitState {
  final int page;
  const BottomnavbarcubitState({required this.page});

  BottomnavbarcubitState copyWith({
    int? page,
  }) {
    return BottomnavbarcubitState(page: page ?? this.page);
  }
}
