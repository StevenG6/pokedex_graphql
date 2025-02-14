import 'package:flutter/material.dart';
import 'package:pokedex_graphql/domain/models.dart';
import 'package:pokedex_graphql/presentation/core/theme/colors.dart';

class PokemonDetailsTabs extends StatelessWidget {
  const PokemonDetailsTabs({
    super.key,
    required this.pokemon
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColors.highlight.withAlpha(150),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              border: const Border(
                left: BorderSide(),
                top: BorderSide(),
                right: BorderSide()
              ),
            ),
            dividerColor: Colors.transparent,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            tabs: const [
              Tab(text: 'Stats', height: 30)
            ]
          ),

          Container(
            decoration: BoxDecoration(
              color: AppColors.cellBackground,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
              border: Border.all(),
            ),
            height: 200,
            child: TabBarView(
              children: [
                _Stats(stats: pokemon.stats),
              ]
            )
          ),
        ]
      )
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({
    required this.stats,
  });

  final PokemonStats stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 6,
      children: [
        _Stat(title: 'HP', value: stats.hp),
        _Stat(title: 'Attack', value: stats.attack),
        _Stat(title: 'Defense', value: stats.defense),
        _Stat(title: 'Sp.Atk', value: stats.specialAttack),
        _Stat(title: 'Sp.Def', value: stats.specialDefense),
        _Stat(title: 'Speed', value: stats.speed),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      duration: const Duration(milliseconds: 700),
      tween: IntTween(
        begin: 0,
        end: value
      ),
      builder: (context, value, child) => Row(
        spacing: 12,
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.end
            )
          ),
          Expanded(
            flex: 3,
            child: LinearProgressIndicator(
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
              value: value / 120,
            )
          ),
          Expanded(
            child: Text(
              value.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
