import 'package:graphql/client.dart';
import 'package:pokedex_graphql/data/services/core/graphql_queries.dart';
import 'package:pokedex_graphql/data/services/pokemon/graphql/models/pokemon_graphql.dart';
import 'package:pokedex_graphql/data/services/pokemon/graphql/models/pokemon_item_graphql.dart';
import 'package:pokedex_graphql/data/services/pokemon/pokemon_service.dart';
import 'package:pokedex_graphql/domain/models.dart';

class PokemonGraphqlService implements PokemonService {
  PokemonGraphqlService({
    required GraphQLClient client,
  }) : _client = client;

  final GraphQLClient _client;

  @override
  Future<List<PokemonItem>> pokemonList({required int limit, required int offset}) async {
    final queryOptions = QueryOptions(
      document: gql(GraphQLQueries.getPokemonList),
      variables: {
        'limit': limit,
        'offset': offset
      },
      parserFn: PokemonSummaryGraphQL.fromJSON
    );

    final result = await _client.query(queryOptions);

    if (result.hasException) throw Exception(result.exception.toString());

    if (result.parsedData == null) throw Exception('An error has occurred while fetching the Pokémon list.');

    return result.parsedData!.results
        .map((e) => PokemonItem(id: e.id, name: e.name, artwork: e.artwork))
        .toList();
  }

  @override
  Future<Pokemon> pokemon(String name) async {
    final queryOptions = QueryOptions(
      document: gql(GraphQLQueries.getPokemon),
      variables: {
        'name': name
      },
      parserFn: PokemonGraphQL.fromJSON
    );

    final result = await _client.query(queryOptions);

    if (result.hasException) throw Exception(result.exception.toString());

    if (result.parsedData == null) throw Exception('An error has occurred while fetching data for $name.');

    return Pokemon(
      id: result.parsedData!.id,
      name: result.parsedData!.name,
      sprites: PokemonSprites(
        front: result.parsedData!.frontSprite,
        back: result.parsedData!.backSprite
      ),
      types: result.parsedData!.types
          .map((type) => PokemonType(name: type))
          .toList()
    );
  }
}
