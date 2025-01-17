import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemon_project/model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/refs/heads/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);
    var pokeList=jsonDecode(result.data)['pokemon'];
    if (pokeList is List ) {
      _list=pokeList.map((e)=> PokemonModel.fromJson(e)).toList();
    } else{
      return [];
    }

    debugPrint(_list.first.toString());
    return _list;
  }
}
