import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CardPage extends StatelessWidget{

  static String route = '/card';

  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de tarjetas'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: <Widget>[
          _tarjeta(),
          _tarjetaImg('https://wallpapercave.com/wp/wp4904541.jpg'),
          _tarjeta(),
          _tarjetaImg('https://besthqwallpapers.com/Uploads/2-3-2019/82208/thumb2-damian-lillard-american-basketball-player-portland-trail-blazers-defender-red-black-paint-splashes.jpg'),
        ],
      ),
    );
  }

  Widget _tarjeta(){
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.casino, color: Colors.blue[400],),
            title: Text('Mi primera tarjeta'),
            subtitle: Text('Lorem impsum asdasdasdasdasdasdasdasd asd asd asda'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: (){}
                ),
              FlatButton(
                child: Text('Si'),
                onPressed: (){}
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _tarjetaImg(String img){
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/img/loading.gif'),
            image: NetworkImage('$img'),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Que chida imagen'),
          )
        ],
      ),
    );
  }

}