import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/config/constants.dart';

class WeekCubit extends Cubit<String> {
  WeekCubit() : super(weekItems.first);

  void updateWeek(String itemName) {
    emit(itemName);
  }
}
