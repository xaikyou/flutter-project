import 'package:number_trivia/core/data_state.dart';
import 'package:number_trivia/features/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<DataState<NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<DataState<NumberTrivia>> getRandomNumberTrivia();
}
