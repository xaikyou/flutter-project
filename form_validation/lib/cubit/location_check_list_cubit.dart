import 'package:flutter_bloc/flutter_bloc.dart';

class LocationCheckListCubit extends Cubit<LocationCheckListState> {
  LocationCheckListCubit(List<dynamic> initialItems)
      : super(LocationCheckListState(initialItems));

  void toggleItem(int index) {
    final items = [...state.checkListItems];
    for (var item in items) {
      item['value'] = false;
    }
    items[index]['value'] = !items[index]['value'];
    emit(LocationCheckListState(items));
  }

  void resetItem() {
    final items = [...state.checkListItems];
    for (var item in items) {
      item['value'] = false;
    }
    emit(LocationCheckListState(items));
  }
}

class LocationCheckListState {
  final List<dynamic> checkListItems;

  LocationCheckListState(this.checkListItems);
}
