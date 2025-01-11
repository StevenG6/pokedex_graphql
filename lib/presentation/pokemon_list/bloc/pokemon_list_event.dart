part of 'pokemon_list_bloc.dart';

@immutable
sealed class PokemonListEvent {}

final class PokemonListStarted extends PokemonListEvent {}
final class PokemonListRetryRequested extends PokemonListEvent {}
