import 'package:flutter/material.dart';

class RefreshHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RefreshHomePageState();
}

class _RefreshHomePageState extends State<RefreshHomePage> {
  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tienda de gatos'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _miTxt('Cuantos gatitos: ', 25.0),
          _miTxt('$_contador', 30.0)
        ],
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.add_shopping_cart),
          onPressed: () {
            _contador++;
            //print('Tengo $_contador gatitos');

            setState(() {});
          },
        ),
        SizedBox(width: 10.0,),
        FloatingActionButton(
          child: Icon(Icons.remove_shopping_cart),
          onPressed: () {
            _contador--;

            setState(() {});
          },
        )
      ]),
    );
  }

  Text _miTxt(String txt, double size){
    return Text('$txt',
      style: TextStyle(fontSize: size),
    );
  }

}
