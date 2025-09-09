import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_graphql/domain/models/pokemon_summary.dart';
import 'package:pokedex_graphql/presentation/home/bloc/home_bloc.dart';
import 'package:pokedex_graphql/presentation/home/widgets/pokemon_list_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({
    super.key,
    required this.items
  });

  final List<PokemonSummary> items;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: screenWidth >= 600 ? 3 : 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) =>
          PokemonListItem(item: widget.items[index]),
    );
  }

  void _onScroll() {
    if (_isScrollAtBottom) context.read<HomeBloc>().add(HomeScrollEndReached());
  }

  bool get _isScrollAtBottom {
    if (!_scrollController.hasClients) return false;

    final currentScroll = _scrollController.offset;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final viewportDimension = _scrollController.position.viewportDimension;
    return currentScroll >= maxScroll - viewportDimension * 0.6;
  }
}
