part of 'ram_cubit.dart';

abstract class RamState extends Equatable {
  const RamState();

  @override
  List<Object> get props => [];
}

class RamLoading extends RamState {}

class RamError extends RamState {}

class RamLoaded extends RamState {
  const RamLoaded({required this.characters});
  final List<Character> characters;

  @override
  List<Object> get props => [characters];
}

class RamWithOutConnexion extends RamState {}
