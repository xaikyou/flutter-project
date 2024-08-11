import 'package:equatable/equatable.dart';

abstract class Usecase<Type, Params> {
  Future<Type> call({Params params});
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object?> get props => [number];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
