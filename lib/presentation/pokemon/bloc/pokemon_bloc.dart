import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_graphql/data/repositories/pokemon/pokemon_repository.dart';
import 'package:pokedex_graphql/domain/models.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({
    required PokemonRepository pokemonRepository
  }) : _pokemonRepository = pokemonRepository,
       super(PokemonInitial()) {
    on<PokemonStarted>(_loadPokemon);
    on<PokemonRetryPressed>(_loadPokemon);
  }

  final PokemonRepository _pokemonRepository;

  Future<void> _loadPokemon(
    PokemonEvent event,
    Emitter<PokemonState> emit
  ) async {
    try {
      emit(PokemonLoadInProgress());

      final pokemon = await _pokemonRepository.pokemon(event.pokemon);

      emit(PokemonLoadSuccess(pokemon));
    } catch (e) {
      log(e.toString());

      emit(PokemonLoadFailure('Failed to load ${ event.pokemon } details. Please try again.'));
    }
  }
}
