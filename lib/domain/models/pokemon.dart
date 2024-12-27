class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types
  });

  final int id;
  final String name;
  final PokemonSprites sprites;
  final List<PokemonType> types;
}

class PokemonSprites {
  PokemonSprites({
    required this.front,
    required this.back
  });

  final String front;
  final String back;
}

class PokemonType {
  PokemonType({required this.name});

  final String name;
}
