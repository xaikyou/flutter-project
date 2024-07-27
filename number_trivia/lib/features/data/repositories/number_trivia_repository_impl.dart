import 'package:dio/dio.dart';
import 'package:number_trivia/core/data_state.dart';
import 'package:number_trivia/features/data/sources/api_service.dart';
import 'package:number_trivia/features/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final ApiService apiService;

  NumberTriviaRepositoryImpl(this.apiService);

  @override
  Future<DataState<NumberTrivia>> getConcreteNumberTrivia(int number) async {
    try {
      final numberTriviaModel =
          await apiService.getNumberTrivia(number.toString());
      return DataSuccess(numberTriviaModel);
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState<NumberTrivia>> getRandomNumberTrivia() async {
    try {
      final numberTriviaModel = await apiService.getNumberTrivia('random');
      return DataSuccess(numberTriviaModel);
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }
}
