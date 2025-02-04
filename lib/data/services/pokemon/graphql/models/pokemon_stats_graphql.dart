class PokemonStatsGraphQL {
  PokemonStatsGraphQL({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed
  });

  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  factory PokemonStatsGraphQL.fromJSON(Map<String, dynamic> json) {
    int hp = 0;
    int attack = 0;
    int defense = 0;
    int specialAttack = 0;
    int specialDefense = 0;
    int speed = 0;

    for (final stat in json['stats']) {
      final statName = stat['stat']['name'];
      final statValue = stat['base_stat'];

      switch (statName) {
        case 'hp':
          hp = statValue;
          break;
        case 'attack':
          attack = statValue;
          break;
        case 'defense':
          defense = statValue;
          break;
        case 'special-attack':
          specialAttack = statValue;
          break;
        case 'special-defense':
          specialDefense = statValue;
          break;
        case 'speed':
          speed = statValue;
          break;
      }
    }

    return PokemonStatsGraphQL(
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed
    );
  }
}
