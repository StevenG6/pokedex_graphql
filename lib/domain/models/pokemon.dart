import 'pokemon_attributes.dart';

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
