import 'package:flutter/material.dart';

import 'package:pokemon_project/widgets/app_title.dart';
import 'package:pokemon_project/widgets/pokemon_list.dart';


class HomePagePokemon extends StatefulWidget {
  const HomePagePokemon({super.key});

  @override
  State<HomePagePokemon> createState() => _HomePagePokemonState();
}

class _HomePagePokemonState extends State<HomePagePokemon> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTitle(),
          const Expanded(child: PokemonList()),
        ],
      ),
    );
  }
}
