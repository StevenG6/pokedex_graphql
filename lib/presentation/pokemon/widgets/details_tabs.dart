import 'package:flutter/material.dart';
import 'package:pokedex_graphql/domain/models.dart';
import 'package:pokedex_graphql/presentation/core/theme/colors.dart';
import 'package:pokedex_graphql/presentation/pokemon/widgets/about_tab.dart';
import 'package:pokedex_graphql/presentation/pokemon/widgets/stats_tab.dart';

class PokemonDetailsTabs extends StatelessWidget {
  const PokemonDetailsTabs({
    super.key,
    required this.pokemon
  });

  final Pokemon pokemon;
  static const _tabHeight = 30.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: AppColors.highlight,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
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
              Tab(text: 'About', height: _tabHeight),
              Tab(text: 'Stats', height: _tabHeight)
            ]
          ),

          Container(
            decoration: BoxDecoration(
              color: AppColors.cellBackground,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              border: Border.all(),
              boxShadow: [BoxShadow(offset: Offset(4, 4))]
            ),
            height: 200,
            child: TabBarView(
              children: [
                AboutTab(pokemon: pokemon),
                StatsTab(stats: pokemon.stats),
              ]
            )
          ),
        ]
      )
    );
  }
}
