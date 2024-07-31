import 'package:flutter_bloc/flutter_bloc.dart';

class FrequencyCheckListCubit extends Cubit<FrequencyCheckListState> {
  FrequencyCheckListCubit(List<dynamic> initialItems)
      : super(FrequencyCheckListState(initialItems));

  void toggleItem(int index) {
    final items = [...state.checkListItems];
    for (var item in items) {
      item['value'] = false;
    }
    items[index]['value'] = !items[index]['value'];
    emit(FrequencyCheckListState(items));
  }

  void resetItem() {
    final items = [...state.checkListItems];
    for (var item in items) {
      item['value'] = false;
    }
    emit(FrequencyCheckListState(items));
  }
}

class FrequencyCheckListState {
  final List<dynamic> checkListItems;

  FrequencyCheckListState(this.checkListItems);
}
