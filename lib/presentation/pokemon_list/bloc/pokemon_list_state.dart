part of 'pokemon_list_bloc.dart';

enum PokemonListStatus { initial, loading, success, failure }

@immutable
final class PokemonListState extends Equatable {
  const PokemonListState({
    this.status = PokemonListStatus.initial,
    this.pokemonItems = const <PokemonItem>[],
    this.error,
  });

  final PokemonListStatus status;
  final List<PokemonItem> pokemonItems;
  final String? error;

  PokemonListState copyWith({
    PokemonListStatus? status,
    List<PokemonItem>? pokemonItems,
    String? error,
  }) {
    return PokemonListState(
      status: status ?? this.status,
      pokemonItems: pokemonItems ?? this.pokemonItems,
      error: error ?? this.error
    );
  }
  
  @override
  List<Object?> get props => [status, pokemonItems, error];
}
