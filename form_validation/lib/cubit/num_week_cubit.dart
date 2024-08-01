import 'package:flutter_bloc/flutter_bloc.dart';

class NumWeekCubit extends Cubit<int> {
  NumWeekCubit() : super(0);

  void update(int number) {
    emit(number);
  }
}
