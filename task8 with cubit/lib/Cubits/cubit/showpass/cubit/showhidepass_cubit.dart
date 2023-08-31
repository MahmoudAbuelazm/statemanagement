import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'showhidepass_state.dart';

class ShowhidepassCubit extends Cubit<ShowhidepassState> {
  ShowhidepassCubit() : super(ShowhidepassInitial());

  bool isshow = false;

  void showhidepass() {
    isshow = !isshow;
    emit(ShowhidepassInitial());
  }
}
