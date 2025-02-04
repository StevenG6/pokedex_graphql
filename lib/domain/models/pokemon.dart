import 'pokemon_attributes.dart';

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.sprites,
    required this.types
  });

  final int id;
  final String name;
  final double height;
  final double weight;
  final PokemonSprites sprites;
  final List<PokemonType> types;
}
