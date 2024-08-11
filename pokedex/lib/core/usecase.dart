import 'package:equatable/equatable.dart';

abstract class Usecase<Type, Params> {
  Future<Type> call(Params params);
}

class Params<T> extends Equatable {
  final T param;

  const Params({required this.param});

  @override
  List<Object?> get props => [param];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
