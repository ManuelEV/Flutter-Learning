//import 'dart:js';

import 'package:flutter/material.dart';

import 'package:tarea2/src/pages/app.dart';
import 'package:tarea2/src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomePage.route,
      routes: getRoutes(),
    );
  }
}
