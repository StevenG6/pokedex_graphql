import 'package:flutter/material.dart';
import 'package:pokedex_graphql/domain/models.dart';
import 'package:pokedex_graphql/presentation/core/theme/colors.dart';
import 'package:pokedex_graphql/presentation/pokemon/widgets/pokemon_screen.dart';
import 'package:pokedex_graphql/utils/string_extension.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({
    super.key,
    required this.item
  });

  final PokemonItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => PokemonScreen(pokemon: item.name))
        );
      },
      child: _PokemonItemView(item)
    );
  }
}

class _PokemonItemView extends StatelessWidget {
  const _PokemonItemView(this.item);

  final PokemonItem item;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.elliptical(30, 20)),
        color: AppColors.cellBackground,
        border: Border.all(width: 1.5),
        boxShadow: const [BoxShadow(offset: Offset(2.5, 2.5))]
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            width: 80,
            right: 10,
            top: -10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.elliptical(15, 10)),
                color: AppColors.cellBackground,
                border: Border.all(width: 1.5),
                boxShadow: const [BoxShadow(offset: Offset(2, 2))]
              ),
              child: Text(
                '#${item.id.toString().padLeft(3, '0')}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                )
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                item.artwork,
              ),

              Text(
                item.name.capitalize(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )
              )
            ]
          )
        ]
      )
    )
  );
}
