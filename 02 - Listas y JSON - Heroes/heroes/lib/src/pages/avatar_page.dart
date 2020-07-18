import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget{

  static String route = '/avatar';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi página de avatar'),
      ),
      body: Center(
          child: Text('Cuerpo del avatar')
        )
    );
  }

}