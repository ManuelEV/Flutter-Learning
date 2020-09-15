import 'package:flutter/material.dart';
import 'package:tarea2/src/pages/alert_page.dart';
import 'package:tarea2/src/pages/avatar_page.dart';
import 'package:tarea2/src/pages/card_page.dart';
import 'package:tarea2/src/pages/salir_page.dart';

import 'package:tarea2/src/utils/hex_to_color_util.dart';

class DrawerPage extends StatelessWidget{

  @override
  Widget build(context){
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[300],
              image: DecorationImage(
                image: AssetImage('assets/img/header.jpg'),
                fit: BoxFit.cover
              )
            ),
            child: Text(
              'Juanito',
              style: TextStyle(
                fontSize: 28.0,
                color: Color(hexToColor("#2c3e50"))
              )
              )
          ),
          ListTile(
            title: Text('Alert'),
            leading: Icon(Icons.perm_contact_calendar),
            onTap: () => Navigator.pushNamed(context, AlertPage.route),
          ),
          ListTile(
            title: Text('Avatar'),
            leading: Icon(Icons.view_agenda),
            onTap: () => Navigator.pushNamed(context, AvatarPage.route),
          ),
          ListTile(
            title: Text('Card'),
            leading: Icon(Icons.card_membership),
            onTap: () => Navigator.pushNamed(context, CardPage.route),
          ),
          ListTile(
            title: Text('Salir'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => Navigator.pushReplacementNamed(context, SalirPage.route) //NO SE PUEDE VOLVER ATRÁS
          )
        ]
      )
    );
  }

}