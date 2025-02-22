import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_graphql/presentation/core/painters/background_painter.dart';
import 'package:pokedex_graphql/presentation/core/widgets.dart';
import 'package:pokedex_graphql/presentation/home/bloc/home_bloc.dart';
import 'package:pokedex_graphql/presentation/home/widgets/pokemon_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(pokemonRepository: context.read())
          ..add(HomeStarted()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
        child: BlocConsumer<HomeBloc, HomeState>(
          listenWhen: (previous, current) {
            return (current.status == HomeStatus.failure && current.pokemonItems.isNotEmpty);
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
            return !(current.status == HomeStatus.failure && current.pokemonItems.isNotEmpty);
          },
          builder: (context, state) {
            switch (state.status) {
              case HomeStatus.initial:
              case HomeStatus.loading:
                return const LoadingIndicator();

              case HomeStatus.success:
                return PokemonList(items: state.pokemonItems);

              case HomeStatus.failure:
                return ErrorMessage(
                  message: state.error!,
                  onButtonPressed: () => context.read<HomeBloc>().add(HomeRetryRequested())
                );
            }
          }
        ),
      ),
    );
  }
}
