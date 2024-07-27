import 'package:dio/dio.dart';
import 'package:number_trivia/features/data/models/number_trivia_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://numbersapi.com/')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('{number}?json')
  Future<NumberTriviaModel> getNumberTrivia(@Path('number') String number);
}
