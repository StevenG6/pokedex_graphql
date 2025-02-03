import 'dart:ui';

import 'package:pokedex_graphql/domain/models.dart';

extension PokemonTypeUtils on PokemonType {
  String get icon => 'assets/icons/pokemon_types/$name.png';

  Color get color {
    switch (this) {
      case PokemonType.normal:
        return const Color.fromARGB(255, 168, 168, 120);
      case PokemonType.fighting:
        return const Color.fromARGB(255, 192, 48, 40);
      case PokemonType.flying:
        return const Color.fromARGB(255, 168, 144, 240);
      case PokemonType.poison:
        return const Color.fromARGB(255, 160, 64, 160);
      case PokemonType.ground:
        return const Color.fromARGB(255, 224, 192, 104);
      case PokemonType.rock:
        return const Color.fromARGB(255, 184, 160, 56);
      case PokemonType.bug:
        return const Color.fromARGB(255, 168, 184, 32);
      case PokemonType.ghost:
        return const Color.fromARGB(255, 112, 88, 152);
      case PokemonType.steel:
        return const Color.fromARGB(255, 184, 184, 208);
      case PokemonType.fire:
        return const Color.fromARGB(255, 240, 128, 48);
      case PokemonType.water:
        return const Color.fromARGB(255, 104, 144, 240);
      case PokemonType.grass:
        return const Color.fromARGB(255, 120, 200, 80);
      case PokemonType.electric:
        return const Color.fromARGB(255, 248, 208, 48);
      case PokemonType.psychic:
        return const Color.fromARGB(255, 248, 88, 136);
      case PokemonType.ice:
        return const Color.fromARGB(255, 152, 216, 216);
      case PokemonType.dragon:
        return const Color.fromARGB(255, 112, 56, 248);
      case PokemonType.dark:
        return const Color.fromARGB(255, 112, 88, 72);
      case PokemonType.fairy:
        return const Color.fromARGB(255, 222, 165, 222);
      case PokemonType.unknown:
        return const Color.fromARGB(255, 88, 87, 87);
    }
  }
}
