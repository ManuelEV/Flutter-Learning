import 'package:flutter/material.dart';
import 'package:heroes/src/pages/alert_page.dart';
import 'package:heroes/src/pages/app.dart';
import 'package:heroes/src/pages/avatar_page.dart';
import 'package:heroes/src/pages/card_page.dart';
import 'package:heroes/src/pages/salir_page.dart';



Map<String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
    AppPage.route: (context) => AppPage(),
    AlertPage.route: (context) => AlertPage(),
    AvatarPage.route: (context) => AvatarPage(),
    CardPage.route: (context) => CardPage(),
    SalirPage.route: (context) => SalirPage(),
  }; 
}