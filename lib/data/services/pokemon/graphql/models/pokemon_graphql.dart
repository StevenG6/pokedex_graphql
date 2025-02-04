class PokemonGraphQL {
  PokemonGraphQL({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.frontSprite,
    required this.backSprite,
    required this.types
  });

  final int id;
  final String name;
  final double height;
  final double weight;
  final String frontSprite;
  final String backSprite;
  final List<String> types;

  factory PokemonGraphQL.fromJSON(Map<String, dynamic> json) {
    final data = json['pokemon'];
    final spritesData = data['sprites'];
    final typesData = data['types'] as List<dynamic>;

    return PokemonGraphQL(
      id: int.parse(data['id'].toString()),
      name: data['name'].toString(),
      height: double.parse(data['height'].toString()),
      weight: double.parse(data['weight'].toString()),
      frontSprite: spritesData['front_default'].toString(),
      backSprite: spritesData['back_default'].toString(),
      types: typesData
          .map((e) => _pokemonTypeFromJSON(e['type']))
          .toList()
    );
  }

  static String _pokemonTypeFromJSON(Map<String, dynamic> json) => json['name'].toString();
}
