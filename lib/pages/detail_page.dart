import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_project/constants/ui_helper.dart';
import 'package:pokemon_project/model/pokemon_model.dart';
import 'package:pokemon_project/widgets/poke_information.dart';
import 'package:pokemon_project/widgets/poke_type_name.dart';


class DetailPagePokemon extends StatelessWidget {

  final PokemonModel pokemon;
  const DetailPagePokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'assets/images/pokeball.png';

    return ScreenUtil().orientation == Orientation.portrait ? _buildPortraitBody(context, pokeballImageUrl): _buildLandscapeBody(context, pokeballImageUrl);

  }
  Scaffold _buildLandscapeBody(BuildContext context, String pokeballImageUrl){
    return Scaffold(
        backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: UIHelper.getDefaultPadding(),
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: Icon(Icons.arrow_back_ios), iconSize: 18.w,),
              ),
              Expanded(child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        PokeTypeName(pokemon: pokemon),
                        Hero(
                            tag: pokemon.id!,
                            child: CachedNetworkImage(imageUrl: pokemon.img ?? '', height: 0.20.sw, fit: BoxFit.fitHeight,)),
                      ],
                    ),
                  ),

                  Expanded(
                      flex:5,
                      child: PokeInformation(pokemon: pokemon)),
                ],
              )
              )
            ],
          ),
        )


    );
  }
  Scaffold _buildPortraitBody(BuildContext context, String pokeballImageUrl){
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back_ios), iconSize: 18.w,),
            ),
            PokeTypeName(pokemon:pokemon),
            SizedBox(height: 20.h,),
            Expanded(child: Stack(
              children: [
                Positioned(child: Image.asset(pokeballImageUrl, fit: BoxFit.fitHeight,),right: 0,top: 50, height: 0.15.sh,),
                Positioned(
                    bottom: 0, right: 0, left: 0, top: 0.15.sh,
                    child: PokeInformation(pokemon: pokemon)),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(imageUrl: pokemon.img ?? '', height: 0.25.sh, fit: BoxFit.fitHeight,)),
                )
              ],
            )),

          ],
        ),
      ),
    );
  }

}
