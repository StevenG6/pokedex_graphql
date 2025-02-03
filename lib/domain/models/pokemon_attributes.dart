enum PokemonType {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown
}

class PokemonSprites {
  PokemonSprites({
    required this.front,
    required this.back
  });

  final String front;
  final String back;
}
