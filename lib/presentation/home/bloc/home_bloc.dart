import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_graphql/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokedex_graphql/domain/models/pokemon_item.dart';
import 'package:pokedex_graphql/utils/event_transformer.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required PokemonRepository pokemonRepository
  }) : _pokemonRepository = pokemonRepository,
       super(const HomeState()) {
    on<HomeStarted>(_loadPokemonList);
    on<HomeRetryRequested>(_loadPokemonList);
    on<HomeScrollEndReached>(
      _loadMoreItems,
      transformer: throttleDroppable(const Duration(seconds: 1))
    );
  }

  final PokemonRepository _pokemonRepository;

  Future<void> _loadPokemonList(
    HomeEvent event,
    Emitter<HomeState> emit
  ) async {
    try {
      emit(
        state.copyWith(
          status: HomeStatus.loading,
          error: null
        )
      );

      final pokemonItems = await _pokemonRepository.pokemonList();

      emit(
        state.copyWith(
          status: HomeStatus.success,
          pokemonItems: pokemonItems,
        )
      );
    } catch (e) {
      log(e.toString());

      emit(
        state.copyWith(
          status: HomeStatus.failure,
          error: 'An error occurred while fetching the Pokémon list.'
        )
      );
    }
  }

  Future<void> _loadMoreItems(
    HomeScrollEndReached event,
    Emitter<HomeState> emit
  ) async {
    try {
      final pokemonItems = await _pokemonRepository.pokemonList(offset: state.pokemonItems.length);

      emit(
        state.copyWith(
          status: HomeStatus.success,
          pokemonItems: [...state.pokemonItems, ...pokemonItems],
        )
      );
    } catch (e) {
      log(e.toString());

      emit(
        state.copyWith(
          status: HomeStatus.failure,
          error: 'Oh no! An error occurred while fetching more Pokémon.'
        )
      );
    }
  }
}
