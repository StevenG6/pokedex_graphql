part of 'pokemon_bloc.dart';

sealed class PokemonEvent {
  const PokemonEvent(this.pokemon);

  final String pokemon;
}

final class PokemonStarted extends PokemonEvent {
  const PokemonStarted(super.pokemon);
}

final class PokemonRetryPressed extends PokemonEvent {
  const PokemonRetryPressed(super.pokemon);
}
