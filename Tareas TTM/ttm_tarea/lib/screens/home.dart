import 'package:flutter/material.dart';
import 'package:ttm_tarea/screens/login.dart';
import 'package:ttm_tarea/utils/data.dart';

class HomeScreen extends StatefulWidget {
  static String tag = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.deepPurple[500]
      ),
      body: Center(
        child: _logOutBtn(),
      ),
    );
  }

  Widget _logOutBtn() {
    return SizedBox(
      width: 220,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text('Logout'),
        color: Colors.pink[500],
        onPressed: () => {
          _eliminarDatos(),
          print('Datos eliminados'),
          Navigator.of(context).pushReplacementNamed(LoginScreen.tag)
        },
        textColor: Colors.white,
      ),
    );
  }

  void _eliminarDatos() async {
    await Data().deleteData('username');
    setState(() {});
  }
}
