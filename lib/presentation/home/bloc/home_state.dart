part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

@immutable
final class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.pokemonItems = const <PokemonItem>[],
    this.error,
  });

  final HomeStatus status;
  final List<PokemonItem> pokemonItems;
  final String? error;

  HomeState copyWith({
    HomeStatus? status,
    List<PokemonItem>? pokemonItems,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      pokemonItems: pokemonItems ?? this.pokemonItems,
      error: error ?? this.error
    );
  }
  
  @override
  List<Object?> get props => [status, pokemonItems, error];
}
