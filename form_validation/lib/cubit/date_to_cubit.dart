import 'package:flutter_bloc/flutter_bloc.dart';

class DateToCubit extends Cubit<DateTime> {
  DateToCubit() : super(DateTime.now());

  void updateDate(DateTime selectedDate) {
    emit(selectedDate);
  }
}
