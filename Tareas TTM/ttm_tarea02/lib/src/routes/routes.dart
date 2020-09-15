import 'package:flutter/material.dart';
import 'package:tarea2/src/pages/alert_page.dart';
import 'package:tarea2/src/pages/app.dart';
import 'package:tarea2/src/pages/avatar_page.dart';
import 'package:tarea2/src/pages/card_page.dart';
import 'package:tarea2/src/pages/salir_page.dart';



Map<String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
    HomePage.route: (context) => HomePage(),
    AlertPage.route: (context) => AlertPage(),
    AvatarPage.route: (context) => AvatarPage(),
    CardPage.route: (context) => CardPage(),
    SalirPage.route: (context) => SalirPage(),
  }; 
}