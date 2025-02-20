import 'package:flutter/material.dart';
import 'package:pokedex_graphql/domain/models.dart';

class StatsTab extends StatelessWidget {
  const StatsTab({
    super.key, 
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
      ]
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
