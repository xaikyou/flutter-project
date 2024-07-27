import 'package:number_trivia/core/data_state.dart';
import 'package:number_trivia/core/usecase.dart';
import 'package:number_trivia/features/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia
    implements Usecase<DataState<NumberTrivia>, Params> {
  final NumberTriviaRepository numberTriviaRepository;

  GetConcreteNumberTrivia(this.numberTriviaRepository);

  @override
  Future<DataState<NumberTrivia>> call(Params params) async {
    return await numberTriviaRepository.getConcreteNumberTrivia(params.number);
  }
}
