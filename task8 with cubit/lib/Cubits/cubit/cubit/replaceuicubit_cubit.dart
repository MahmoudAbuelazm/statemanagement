import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'replaceuicubit_state.dart';

class ReplaceuicubitCubit extends Cubit<ReplaceuicubitState> {
  ReplaceuicubitCubit() : super(ReplaceuicubitInitial());

  void showtext() {
    emit(ShowText());
  }

  void showcubit() {
    emit(ShowCubit());
  }

  void showshape() {
    emit(ShowShape());
  }

  void reset() {
    emit(ReplaceuicubitInitial());
  }
}
