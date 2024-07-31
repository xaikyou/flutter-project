import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EndTimeCubit extends Cubit<TimeOfDay> {
  EndTimeCubit() : super(TimeOfDay.now());

  void updateTime(TimeOfDay selectedTime) {
    emit(selectedTime);
  }
}
