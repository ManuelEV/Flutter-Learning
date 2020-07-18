import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget{

  static String route = '/alert';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi página de alertas'),
      ),
      body: Center(
          child: Text('Cuerpo de las alertas')
        )
    );
  }

}