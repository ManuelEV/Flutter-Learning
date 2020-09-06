import 'package:flutter/services.dart';
import 'dart:convert';



class _UsersProvider {

  List<dynamic> users = [];

  _UsersProvider(){

  }

  Future<List<dynamic>> loadUsers() async{
    final String usersJson = await rootBundle.loadString('assets/users.json');

    Map<String, dynamic> usersMap = json.decode(usersJson);
    users = usersMap['users'];

    return users;

  }

}

final usersProvider = new _UsersProvider();
