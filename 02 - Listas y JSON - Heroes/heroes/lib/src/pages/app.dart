import 'package:flutter/material.dart';

import 'package:heroes/src/pages/drawer_page.dart';

import 'package:heroes/src/providers/heroes_provider.dart';
import 'package:heroes/src/utils/json_icon_util.dart';

class AppPage extends StatelessWidget{

  static String route = '/';

  final List<String> heroesList = [
    'Superman', 'Spiderman', 'Acuaman', 'Redman', 'Chupacabras'
  ];

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        appBar: AppBar(
          title: Text('Mi Lista de Heroes'),
        ),
        drawer: DrawerPage(),
        body: _jsonHeroes()
      );


  }

  List<Widget> _listHeroes(){
    List<Widget> miListaWidget = new List<Widget>();
    for (var heroe in heroesList) {
      final tempWidget = ListTile(title: Text(heroe),);
      miListaWidget.add(tempWidget);
      miListaWidget.add(Divider());
    }
    return miListaWidget;
  }


  //Opción B -> map
  List<Column> _mapHeroes(){
    //heroesProvider.loadHeroes();
    return heroesList.map((heroe) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('$heroe'),
            subtitle: Text('Soy un superheroe'),
            leading: Icon(Icons.accessibility),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              print('$heroe');
            },
          ),
          Divider()
        ],
      );
  }).toList();
  }

  Widget _jsonHeroes(){
    return FutureBuilder(
      future: heroesProvider.loadHeroes(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
        List<Widget> miLista = new List<Widget>();
        snapshot.data.forEach((heroe) {
          Column temp = Column(
            children: <Widget>[
              ListTile(
                title: Text(heroe['nombre']),
                subtitle: Text(heroe['poder']),
                leading: getIcon(heroe['icon'], heroe['color']),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => print('Soy ${heroe['nombre']}'),
              ),
              Divider()
            ],
          );

          miLista.add(temp);

        });

          return ListView(
            children: miLista,
          );

      },
    );
  }

}