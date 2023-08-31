import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changeselectedvalue_state.dart';

class ChangeselectedvalueCubit extends Cubit<ChangeselectedvalueState> {
  ChangeselectedvalueCubit() : super(ChangeselectedvalueInitial());


  int selectedindex = 0;

  void changeselectedvalue(int index) {
    selectedindex = index;
    emit(ChangeselectedvalueInitial());
  }
}
