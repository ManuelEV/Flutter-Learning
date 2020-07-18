import 'package:flutter/services.dart';
import 'dart:convert';

class _HeroesProvider{

  List<dynamic> heroes = [];

  _HeroesProvider(){

  }

  Future<List<dynamic>> loadHeroes() async{
    final String heroesJson = await rootBundle.loadString('assets/json/heroes.json');

    Map<String, dynamic> heroesMap = json.decode(heroesJson);
    heroes = heroesMap['heroes'];

    return heroes;

  }

}

final heroesProvider = new _HeroesProvider();

