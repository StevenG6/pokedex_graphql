import 'package:provider/provider.dart';
import 'package:graphql/client.dart';
import 'package:pokedex_graphql/data/repositories/pokemon/default_pokemon_repository.dart';
import 'package:pokedex_graphql/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_graphql/data/services/core/graphql_client.dart';
import 'package:pokedex_graphql/data/services/pokemon/graphql/pokemon_graphql_service.dart';
import 'package:pokedex_graphql/data/services/pokemon/pokemon_service.dart';

List<Provider> get providers => [
  Provider<GraphQLClient>(
    create: (_) => graphQLClient
  ),
  Provider<PokemonService>(
    create: (context) => PokemonGraphqlService(
      client: context.read<GraphQLClient>()
    )
  ),
  Provider<PokemonRepository>(
    create: (context) => DefaultPokemonRepository(
      pokemonService: context.read<PokemonService>()
    )
  ),
];
