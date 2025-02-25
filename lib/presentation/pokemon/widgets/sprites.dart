import 'package:flutter/material.dart';
import 'package:pokedex_graphql/domain/models.dart';
import 'package:pokedex_graphql/presentation/core/painters/pokedex_painter.dart';
import 'package:pokedex_graphql/presentation/core/widgets.dart';
import 'package:pokedex_graphql/utils/pokemon_extension.dart';

class Sprites extends StatelessWidget {
  const Sprites({
    super.key,
    required this.pokemon
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PokedexPainter(backgroundColor: pokemon.types.first.color.withAlpha(50)),
      child: SizedBox(
        width: 300,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(pokemon.types.first.icon),
                opacity: 0.5,
                scale: 0.4
              )
            ),
            child: CarouselView(
              itemExtent: double.infinity,
              enableSplash: false,
              itemSnapping: true,
              backgroundColor: Colors.transparent,
              children: [pokemon.sprites.front, pokemon.sprites.back].map(
                (sprite) => Image.network(
                  sprite,
                  scale: 0.5,
                  errorBuilder: (_, __, ___) => const ErrorImage()
                )
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
