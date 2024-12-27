class GraphQLQueries {
  static const getPokemonList =
    r'''
      query pokemonList($limit: Int, $offset: Int) {
        pokemons(limit: $limit, offset: $offset) {
          results {
            id
            name
            image
          }
        }
      }
    '''
  ;

  static const getPokemon =
    r'''
      query pokemon($name: String!) {
        pokemon(name: $name) {
          id
          name
          sprites {
            front_default
            back_default
          }
          types {
            type {
              name
            }
          }
        }
      }
    '''
  ;
}
