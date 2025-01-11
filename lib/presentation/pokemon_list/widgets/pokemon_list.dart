import 'package:flutter/material.dart';
import 'package:pokedex_graphql/domain/models/pokemon_item.dart';
import 'package:pokedex_graphql/presentation/core/theme/colors.dart';
import 'package:pokedex_graphql/utils/string_extension.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({
    super.key,
    required this.items
  });

  final List<PokemonItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => _PokemonListItem(item: items[index])
    );
  }
}

class _PokemonListItem extends StatelessWidget {
  const _PokemonListItem({required this.item});

  final PokemonItem item;

  @override
  Widget build(BuildContext context) {
    const border = Border(
      top: BorderSide(color: Colors.black, width: 1.5),
      right: BorderSide(color: Colors.black, width: 3.5),
      bottom: BorderSide(color: Colors.black, width: 3.5),
      left: BorderSide(color: Colors.black, width: 1.5),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(30, 20)),
          color:   AppColors.cellBackground,
          border: border
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.elliptical(15, 10)),
                  color:  AppColors.cellBackground,
                  border: border
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
}
