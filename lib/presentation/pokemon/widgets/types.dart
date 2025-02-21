import 'package:flutter/material.dart';
import 'package:pokedex_graphql/domain/models.dart';
import 'package:pokedex_graphql/utils/pokemon_extension.dart';
import 'package:pokedex_graphql/utils/string_extension.dart';

class Types extends StatelessWidget {
  const Types({
    super.key,
    required this.types
  });

  final List<PokemonType> types;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: types.map(
        (type) => _TypeChip(type)
      ).toList()
    );
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip(this.type);

  final PokemonType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: type.color,
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(offset: Offset(2, 2))]
      ),
      child: Row(
        spacing: 8,
        children: [
          Image.asset(
            type.icon,
            color: Colors.white,
            height: 28,
          ),
          Text(
            type.name.capitalize(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 1
            ),
          )
        ],
      )
    );
  }
}
