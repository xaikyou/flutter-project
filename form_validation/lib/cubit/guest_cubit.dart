import 'package:flutter_bloc/flutter_bloc.dart';

abstract class GuestState {}

class GuestInitial extends GuestState {}

class GuestUpdated extends GuestState {
  final List<String> guests;
  GuestUpdated(this.guests);
}

class GuestCubit extends Cubit<GuestState> {
  GuestCubit() : super(GuestInitial());

  void update(List<String> guests) {
    emit(GuestUpdated(guests));
  }
}
