import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class IntermediateLayerCubit extends Cubit<IntermediateLayerCubitState> {
  IntermediateLayerCubit() : super(IntermediateLayerCubitState(results: []));

  void update(List<ScanResult> results) {
    emit(IntermediateLayerCubitState(results: results));
  }

  void add(ScanResult result) {
    final tmp = [...state.results];
    tmp.add(result);
    emit(IntermediateLayerCubitState(results: tmp));
  }
}

class IntermediateLayerCubitState {
  final List<ScanResult> results;

  IntermediateLayerCubitState({required this.results});
}
