import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_graphql/presentation/core/painters/background_painter.dart';
import 'package:pokedex_graphql/presentation/core/widgets.dart';
import 'package:pokedex_graphql/presentation/pokemon_list/bloc/pokemon_list_bloc.dart';
import 'package:pokedex_graphql/presentation/pokemon_list/widgets/pokemon_list.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PokemonListBloc(pokemonRepository: context.read())
          ..add(PokemonListStarted()),
      child: const PokemonListBody(),
    );
  }
}

class PokemonListBody extends StatelessWidget {
  const PokemonListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset(
          'assets/images/pokemon_logo.png',
          height: 40,
          alignment: Alignment.centerLeft,
        )
      ),
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: BlocConsumer<PokemonListBloc, PokemonListState>(
          listenWhen: (previous, current) {
            return (current.status == PokemonListStatus.failure && current.pokemonItems.isNotEmpty);
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error!,
                  textAlign: TextAlign.center,
                ),
              )
            );
          },
          buildWhen: (previous, current) {
            return !(current.status == PokemonListStatus.failure && current.pokemonItems.isNotEmpty);
          },
          builder: (context, state) {
            switch (state.status) {
              case PokemonListStatus.initial:
              case PokemonListStatus.loading:
                return const LoadingIndicator();

              case PokemonListStatus.success:
                return PokemonList(items: state.pokemonItems);

              case PokemonListStatus.failure:
                return ErrorMessage(
                  message: state.error!,
                  onButtonPressed: () => context.read<PokemonListBloc>().add(PokemonListRetryRequested())
                );
            }
          }
        ),
      ),
    );
  }
}
