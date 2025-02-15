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
    return Chip(
      label: Text(type.name.capitalize()),
      labelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 1
      ),
      avatar: Image.asset(
        type.icon,
        color: Colors.white,
      ),
      backgroundColor: type.color,
      side: const BorderSide(color: Colors.black12),
    );
  }
}
