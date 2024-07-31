import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<String> {
  CategoryCubit() : super('Select a category');

  void updateCategory(String categoryName) {
    emit(categoryName);
  }
}
