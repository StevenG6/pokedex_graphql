part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonState extends Equatable {
  const PokemonState();
  
  @override
  List<Object> get props => [];
}

final class PokemonInitial extends PokemonState {}

final class PokemonLoadInProgress extends PokemonState {}

final class PokemonLoadSuccess extends PokemonState {
  const PokemonLoadSuccess(this.pokemon);
  final Pokemon pokemon;
  
  @override
  List<Object> get props => [pokemon];
}

final class PokemonLoadFailure extends PokemonState {
  const PokemonLoadFailure(this.error);
  final String error;
  
  @override
  List<Object> get props => [error];
}
