import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radiotoggle_state.dart';

class RadiotoggleCubit extends Cubit<RadiotoggleState> {
  RadiotoggleCubit() : super(RadiotoggleInitial());

  int currentindex = 0;

  void toggle(int value) {
    currentindex = value;
    emit(RadiotoggleInitial());
  }
}
