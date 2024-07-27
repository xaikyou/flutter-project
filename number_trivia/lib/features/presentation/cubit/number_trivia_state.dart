part of 'number_trivia_cubit.dart';

enum TypeState { concrete, random }

sealed class NumberTriviaState extends Equatable {
  final NumberTrivia? numberTrivia;
  final DioException? exception;

  const NumberTriviaState({this.numberTrivia, this.exception});

  @override
  List<Object> get props => [numberTrivia!, exception!];
}

class LoadingState extends NumberTriviaState {
  const LoadingState();
}

class ErrorState extends NumberTriviaState {
  const ErrorState(DioException exception) : super(exception: exception);
}

class DoneState extends NumberTriviaState {
  const DoneState(NumberTrivia numberTrivia)
      : super(numberTrivia: numberTrivia);
}
