import 'package:pokedex_graphql/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokedex_graphql/data/services/pokemon/graphql/pokemon_graphql_service.dart';
import 'package:pokedex_graphql/data/services/pokemon/pokemon_service.dart';
import 'package:pokedex_graphql/domain/models.dart';

class DefaultPokemonRepository implements PokemonRepository {
  DefaultPokemonRepository({
    PokemonService? pokemonService
  }) : _pokemonService = pokemonService ?? PokemonGraphqlService();

  final PokemonService _pokemonService;

  @override
  Future<List<PokemonItem>> pokemonList({int limit = 20, int offset = 0}) async {
    return _pokemonService.pokemonList(limit: limit, offset: offset);
  }

  @override
  Future<Pokemon> pokemon(String name) async {
    return _pokemonService.pokemon(name);
  }
}
