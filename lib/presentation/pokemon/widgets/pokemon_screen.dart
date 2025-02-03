import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_graphql/domain/models.dart';
import 'package:pokedex_graphql/utils/pokemon_extension.dart';
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
          icon: Icon(Icons.arrow_back)
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
        spacing: 8,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: pokemon.types.first.color.withAlpha(50),
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                image: AssetImage(pokemon.types.first.icon),
                opacity: 0.4,
                scale: 0.5
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [pokemon.sprites.front, pokemon.sprites.back].map(
                (sprite) => Image.network(
                  sprite,
                  scale: 0.6,
                )
              ).toList(),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: pokemon.types.map(
              (type) => _TypeChip(type)
            ).toList()
          ),
        ]
      )
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
      labelStyle: TextStyle(
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
      side: BorderSide(color: Colors.black12),
    );
  }
}
