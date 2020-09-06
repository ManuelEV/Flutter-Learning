import 'package:flutter/material.dart';
import 'package:ttm_tarea/screens/home.dart';
import 'package:ttm_tarea/utils/data.dart';

import 'package:ttm_tarea/providers/users_provider.dart';

class LoginScreen extends StatefulWidget {
  static String tag = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String error = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _obtenerDatos(datos: ['username']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.deepPurple[500]
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
          _buildUsernameField(),
          SizedBox(height: 20.0),
          _buildPasswordField(),
          SizedBox(height: 20.0),
          _buildLoginBtn(),
          SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
          ],
          )
        )
      )
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
        controller: usernameController,
        validator: (val) => val.isEmpty ? 'Ingrese un usuario' : null,
        onChanged: (val) {
                  //setState(() => print(val));
                },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          hintText: 'Username',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        textAlign: TextAlign.center,
      );
  }

  Widget _buildPasswordField() {
    return  TextFormField(
        controller: passwordController,
        validator: (val) => val.length < 6 ? 'Ingrese una contraseña de más de 6 caracteres' : null,
        onChanged: (val) {
                  //setState(() => print(val));
                },
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        textAlign: TextAlign.center,
        obscureText: true,
      );
  }

  Future<bool> _validUser(username, password) async{
      var validUser = false;
      var users = await usersProvider.loadUsers();

      print(users);

      users.forEach((user){
        print(user);
        print(user['username']);
        if(user['username'] == username && user['password'] == password){
          validUser = true;
        }
      });

      print(validUser);
      return validUser;

  }

  Widget _buildLoginBtn() {
    return SizedBox(
      width: 220,
      height: 45,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text('Login'),
        color: Colors.pink[500],
        onPressed: () => {
          _validUser(usernameController.text, passwordController.text).then((result) {
            print('VALIDATOR: ');
          print(_formKey.currentState.validate());
            if (result){
              print('Login correcto');
              _guardarDatos();
              Navigator.of(context).pushReplacementNamed(HomeScreen.tag);
            }
          else{
            print('Advertencia login incorrecto');
            if(_formKey.currentState.validate()){
              setState(() {
                error = 'Credenciales incorrectas';
              });
            }
            print(error);
            }
          })
        },
        textColor: Colors.white,
      ),
    );
  }

  void _obtenerDatos({List<String> datos}) async {
    for (String nombreDato in datos) {
      bool exist = await Data().checkData(nombreDato);
      if (exist) {
        String datoObtenido = await Data().getData(nombreDato);
        if (nombreDato == 'username') {
          usernameController.text = datoObtenido;
        }
      }
    }
    setState(() {});
  }

  void _guardarDatos() async {
    await Data().saveData('username', usernameController.text);
    setState(() {});
  }

  


}
