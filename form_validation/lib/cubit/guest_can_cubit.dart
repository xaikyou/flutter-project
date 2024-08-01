import 'package:flutter_bloc/flutter_bloc.dart';

class GuestCanCubit extends Cubit<GuestCanState> {
  GuestCanCubit(List<dynamic> initialItems)
      : super(GuestCanState(initialItems));

  void toggleItem(int index) {
    final items = [...state.checkListItems];
    items[index]['value'] = !items[index]['value'];
    emit(GuestCanState(items));
  }

  void reset() {
    final items = [...state.checkListItems];
    for (var item in items) {
      item['value'] = false;
    }
    emit(GuestCanState(items));
  }
}

class GuestCanState {
  final List<dynamic> checkListItems;

  GuestCanState(this.checkListItems);
}
