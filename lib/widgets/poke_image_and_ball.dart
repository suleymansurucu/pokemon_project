import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/ui_helper.dart';
import '../model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  final PokemonModel pokemon;

  String pokeballImageUrl = 'assets/images/pokeball.png';

  PokeImageAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UIHelper.getAppTitleWidgetHeight(),
            height: UIHelper.calculatePokeImageAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Hero(
              tag: pokemon.id!,
              child: CachedNetworkImage(
                imageUrl: pokemon.img!,
                width: UIHelper.getAppTitleWidgetHeight(),
                height: UIHelper.calculatePokeImageAndBallSize(),
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => const CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            )),
      ],
    );
  }
}
