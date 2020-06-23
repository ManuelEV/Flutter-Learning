import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  int _contador = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
        appBar: AppBar(
          title: Text('Tienda de gatos'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Cuantos gatitos: ',
                style: TextStyle(fontSize: 25.0),
              ),
              Text('$_contador',
                style: TextStyle(fontSize: 30.0),
              )
            ],
          )
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add_shopping_cart),
      onPressed: () => _contador++,
    ),
    );
  }

}