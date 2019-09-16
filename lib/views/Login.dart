import 'package:flutter/material.dart';
import 'package:panic/model/user_model.dart' as prefix0;

import 'BtnPanic.dart';
import '../model/user_model.dart';
import 'package:panic/api/api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../data/classes/user.dart';
import 'Maps.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  TextEditingController _numberController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  String mensaje = '';

  Future<dynamic> login() async {
    Map<String, dynamic> user = {"number": 312313, "password": "asdasfas"};

    var loguser = convert.jsonEncode(user);
    try {
      final response =
          await http.post('localhost:3000/users/login/', body: loguser);
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Log In'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Celular"),
                controller: _numberController,
              ),
              Container(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Contraseña"),
                controller: _passwordController,
              ),
              Container(
                height: 20,
              ),
              _isLoading
                  ? CircularProgressIndicator()
                  : SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.red[300],
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        // onPressed: () {
                        //   login();
                        //   // Navigator.push(
                        //   //   context,
                        //   //   MaterialPageRoute(builder: (context) => BtnPanic()),
                        //   // );
                        // },
                        onPressed: () {
                          
                          Navigator.push(
                             context,
                            MaterialPageRoute(builder: (context) => MapaPage()),
                           );
                        },
                      ),
                    ),
            ],
          ),
        ));
  }
}
