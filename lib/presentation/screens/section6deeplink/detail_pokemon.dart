import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/config/plugins/share_plugin.dart';
import 'package:riverpod_recursos_nativos/domain/entities/pokemon.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/pokemons/pokemon_provider.dart';

class DetailPokemons extends ConsumerWidget {
  const DetailPokemons({super.key, required this.pokemonID});

  final String pokemonID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonID));
    return pokemonAsync.when(
        data: (pokemon) => _PokemonView(pokemon: pokemon),
        error: (error, stackTrace) => _ErrorWidget(error: error.toString()),
        loading: () => const _LoadingWidget());
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error)),
    );
  }
}

class _PokemonView extends StatelessWidget {
  const _PokemonView({required this.pokemon});
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
              onPressed: () {
                // link = deeLink
                SharePlugin.shareLink(
                    pokemon.sprinteFront, 'mira este pokemon');
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: Center(
          child: Image.network(
        pokemon.sprinteFront,
        fit: BoxFit.contain,
        width: 150,
        height: 150,
      )),
    );
  }
}
