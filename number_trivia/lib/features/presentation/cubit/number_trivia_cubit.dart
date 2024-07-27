import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia/core/data_state.dart';
import 'package:number_trivia/core/usecase.dart';
import 'package:number_trivia/features/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/features/domain/usecases/get_random_number_trivia.dart';

part 'number_trivia_state.dart';

class NumberTriviaCubit extends Cubit<NumberTriviaState> {
  final GetConcreteNumberTrivia concrete;
  final GetRandomNumberTrivia random;

  NumberTriviaCubit(this.concrete, this.random) : super(const LoadingState());

  Future<void> getConcretNumberTrivia(int number) async {
    emit(const LoadingState());
    final dataState = await concrete(Params(number: number));

    if (dataState is DataSuccess && dataState.data != null) {
      emit(DoneState(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(ErrorState(dataState.exception!));
    }
  }

  Future<void> getRandomNumberTrivia() async {
    emit(const LoadingState());
    final dataState = await random(NoParams());

    if (dataState is DataSuccess && dataState.data != null) {
      emit(DoneState(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(ErrorState(dataState.exception!));
    }
  }
}
