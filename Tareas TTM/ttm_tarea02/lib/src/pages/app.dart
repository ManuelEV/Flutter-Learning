import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tarea2/src/pages/drawer_page.dart';

import 'package:tarea2/src/utils/connected.dart';
import 'package:tarea2/src/services/test_service.dart';
import 'package:tarea2/src/models/mis_heroes_model.dart';
import 'package:tarea2/src/utils/json_icon_util.dart';

class HomePage extends StatefulWidget {
  static String route = '/';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mensajeConn = '';
  MisHeroesModel heroes = MisHeroesModel();

  void checkConn() async {
    bool connectionAvailable = await Connected().isConnected();

    (connectionAvailable)
        ? this.mensajeConn = 'Si hay conexión'
        : this.mensajeConn = 'No hay conexión';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Application'),
      ),
      drawer: DrawerPage(),
      body: _jsonHeroes(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            mini: true,
            heroTag: 'btnList',
            backgroundColor: Colors.green,
            child: Icon(Icons.update),
            onPressed: (() => this.getList()),
          ),
          FloatingActionButton(
            mini: true,
            heroTag: 'btnSaludo',
            backgroundColor: Colors.yellow,
            child: Icon(
              Icons.arrow_upward,
              color: Colors.black,
            ),
            onPressed: (() => this.postSaludo()),
          ),
          FloatingActionButton(
            heroTag: 'btnCheckNetwork',
            child: Icon(Icons.network_check),
            onPressed: (() => this.checkConn()),
          ),
        ],
      ),
    );
  }

  Widget _jsonHeroes() {

    if (this.heroes.nombre != null) {
      List<Widget> miLista = new List<Widget>();
      //utf8.decode(heroes.nombre.runes.toList());
      this.heroes.heroes.forEach((heroe) {
        Column temp = Column(children: <Widget>[
          ListTile(
            title: Text(heroe.nombre),
            subtitle: Text(heroe.poder),
            leading: getIcon(heroe.icon, heroe.color),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => print('Soy ${heroe.nombre}'),
          ),
          Divider()
        ]);
        miLista.add(temp);
      });
      return ListView(children: miLista);
    }else{
      return Center(
        child: Text(this.mensajeConn),
      );
    }
  }

  void getList() async {
    bool connectionAvailable = await Connected().isConnected();
    (connectionAvailable)
        ? this.heroes = await TestService().getLista()
        : print('No hay conexión');

    if (this.heroes != null) {
      print(utf8.decode(heroes.nombre.runes.toList()));
      print(this.heroes.heroes[3].nombre);
      setState(() {});
    }
  }

  void postSaludo() async {
    bool connectionAvailable = await Connected().isConnected();
    (connectionAvailable)
        ? TestService().postGreeting()
        : print('No hay internet');
  }
}
