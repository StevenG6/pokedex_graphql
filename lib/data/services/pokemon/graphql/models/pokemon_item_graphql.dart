class PokemonItemGraphQL {
  PokemonItemGraphQL({
    required this.id,
    required this.name,
    required this.artwork
  });

  final int id;
  final String name;
  final String artwork;

  factory PokemonItemGraphQL.fromJSON(Map<String, dynamic> json)
      => PokemonItemGraphQL(
          id: int.parse(json['id'].toString()),
          name: json['name'].toString(),
          artwork: json['artwork'].toString()
        );
}

class PokemonSummaryGraphQL {
  PokemonSummaryGraphQL(this.results);

  final List<PokemonItemGraphQL> results;
  
  factory PokemonSummaryGraphQL.fromJSON(Map<String, dynamic> json) {
    final data = json['pokemons'];

    return PokemonSummaryGraphQL(
      (data['results'] as List<dynamic>)
          .map((e) => PokemonItemGraphQL.fromJSON(e))
          .toList()
    );
  }
}
