import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartTimeCubit extends Cubit<TimeOfDay> {
  StartTimeCubit() : super(TimeOfDay.now());

  void updateTime(TimeOfDay selectedTime) {
    emit(selectedTime);
  }
}
