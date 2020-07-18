import 'package:flutter/material.dart';

class SalirPage extends StatelessWidget{

  static String route = '/salir';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasta pronto'),
      ),
      body: Center(
          child: Text('Para volver realice Hot restart')
        )
    );
  }

}