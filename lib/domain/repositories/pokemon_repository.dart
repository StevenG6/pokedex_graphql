import 'package:pokedex_graphql/domain/models.dart';

abstract class PokemonRepository {
  
  /// Returns a list of [PokemonItem].
  /// 
  /// The number of [PokemonItem] returned is limited by [limit], and
  /// the starting Pokémon in the list is determined by [offset].
  Future<List<PokemonItem>> pokemonList({int limit, int offset});

  /// Returns details for a [Pokemon] with the given [name].
  Future<Pokemon> pokemon(String name);
}
