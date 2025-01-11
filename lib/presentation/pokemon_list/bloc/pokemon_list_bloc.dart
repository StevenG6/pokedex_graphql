import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_graphql/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokedex_graphql/domain/models/pokemon_item.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc({
    required PokemonRepository pokemonRepository
  }) : _pokemonRepository = pokemonRepository,
       super(const PokemonListState()) {
    on<PokemonListStarted>(_loadPokemonList);
    on<PokemonListRetryRequested>(_loadPokemonList);
  }

  final PokemonRepository _pokemonRepository;

  Future<void> _loadPokemonList(
    PokemonListEvent event,
    Emitter<PokemonListState> emit
  ) async {
    try {
      emit(
        state.copyWith(
          status: PokemonListStatus.loading,
          error: null
        )
      );

      final pokemonItems = await _pokemonRepository.pokemonList();

      emit(
        state.copyWith(
          status: PokemonListStatus.success,
          pokemonItems: pokemonItems,
        )
      );
    } catch (e) {
      log(e.toString());

      emit(
        state.copyWith(
          status: PokemonListStatus.failure,
          error: 'An error occurred while fetching the Pokémon list.'
        )
      );
    }
  }
}
