import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttm_tarea/screens/home.dart';
import 'package:ttm_tarea/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString('username');
  final routes = <String, WidgetBuilder>{
    HomeScreen.tag: (context) => HomeScreen(),
    LoginScreen.tag: (context) => LoginScreen(),
  };

  runApp(
    MaterialApp(
      home: user == null ? LoginScreen() : HomeScreen(),
      routes: routes,
    ),
  );
}
