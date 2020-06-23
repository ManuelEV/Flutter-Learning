import 'package:first_project/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:first_project/src/pages/refresh_home_page.dart';

class SuperApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RefreshHomePage()
    );
  }
}