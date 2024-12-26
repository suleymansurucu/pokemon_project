import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants_pokedex.dart';
import '../constants/ui_helper.dart';
import '../model/pokemon_model.dart';


class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.w),
          ),
          color: Colors.white),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', pokemon.name),
            _buildInformationRow('Height', pokemon.height),
            _buildInformationRow('Weight', pokemon.weight),
            _buildInformationRow('Spawn Time', pokemon.spawnTime),
            _buildInformationRow('Weakness', pokemon.weaknesses),
            _buildInformationRow('Pre Evolution', pokemon.prevEvolution),
            _buildInformationRow('Next Evolution', pokemon.nextEvolution)
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Constants_Pokedex.getPokeLabelTextStyle(),),
        if (value is List && value.isNotEmpty)
          Text(value.join(' , ').toString(), style: Constants_Pokedex.getPokeInfoTextStyle(),)
        else if (value == null)
          const Text('Not Available')
        else
          Text(value.toString(), style: Constants_Pokedex.getPokeInfoTextStyle(),),
      ],
    );
  }
}
