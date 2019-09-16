import 'package:flutter/material.dart';

class Registrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  //login facebook
                },
              ),
            ),
            Container(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.red[300],
                child: Text(
                  'Gmail',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  //Login Gmail
                },
              ),
            ),
            Container(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.green,
                child: Text(
                  'Celular',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  //Login Celular
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
