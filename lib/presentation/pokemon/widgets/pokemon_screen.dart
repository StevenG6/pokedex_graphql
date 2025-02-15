import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_graphql/domain/models.dart';
import 'package:pokedex_graphql/presentation/pokemon/widgets/details_tabs.dart';
import 'package:pokedex_graphql/presentation/pokemon/widgets/sprites.dart';
import 'package:pokedex_graphql/presentation/pokemon/widgets/types.dart';
import 'package:pokedex_graphql/presentation/core/widgets.dart';
import 'package:pokedex_graphql/presentation/pokemon/bloc/pokemon_bloc.dart';
import 'package:pokedex_graphql/utils/string_extension.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key, required this.pokemon});

  final String pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonBloc(pokemonRepository: context.read())
        ..add(PokemonStarted(pokemon)),
      child: PokemonView(pokemon: pokemon)
    );
  }
}

class PokemonView extends StatelessWidget {
  const PokemonView({
    super.key,
    required this.pokemon
  });

  final String pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.capitalize()),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          switch (state) {
            case PokemonInitial():
            case PokemonLoadInProgress():
              return const LoadingIndicator();

            case PokemonLoadSuccess():
              return PokemonDetails(pokemon: state.pokemon);

            case PokemonLoadFailure():
              return ErrorMessage(
                message: state.error,
                onButtonPressed: () => context.read<PokemonBloc>().add(PokemonRetryPressed(pokemon))
              );
          }
        }
      )
    );
  }
}

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    super.key,
    required this.pokemon
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        spacing: 20,
        children: [
          Sprites(pokemon: pokemon),

          Types(types: pokemon.types),

          PokemonDetailsTabs(pokemon: pokemon),
        ]
      )
    );
  }
}
