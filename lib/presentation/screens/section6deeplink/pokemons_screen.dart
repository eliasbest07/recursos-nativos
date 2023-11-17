import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/pokemons/pokemon_list_provider.dart';

class PokemonScreen extends ConsumerStatefulWidget {
  const PokemonScreen({super.key});

  @override
  PokemonScreenState createState() => PokemonScreenState();
}

final scrollControler = ScrollController();

class PokemonScreenState extends ConsumerState<PokemonScreen> {
  void infinityScroll() {
    final currentPokemons = ref.read(pokemonIdsProvider);
    if (currentPokemons.length > 400) {
      scrollControler.removeListener(infinityScroll);
      return;
    }
    if (scrollControler.position.pixels + 200 >
        scrollControler.position.maxScrollExtent) {
      ref.read(pokemonIdsProvider.notifier).update((state) => [
            ...state,
            ...List.generate(30, (index) => state.length + index + 1)
          ]);
    }
  }

  @override
  void initState() {
    scrollControler.addListener(infinityScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollControler,
      slivers: [
        SliverAppBar(
          title: const Text('Lista de Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withOpacity(0.8),
        ),
        const _PokemonGrid()
      ],
    );
  }
}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonId = ref.watch(pokemonIdsProvider);
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisExtent: 2, crossAxisSpacing: 2),
      itemCount: pokemonId.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push('/pokemons/${index + 1}');
          },
          child: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
