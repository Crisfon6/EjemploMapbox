import 'package:flutter/material.dart';

import './views/Login.dart';
import './views/Registrar.dart';

//void main() => runApp(MyApp());
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red[300],
        primarySwatch: Colors.red,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new Login(),
        '/registrar': (BuildContext context) => new Registrar()
      },
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panic'),
        backgroundColor: Colors.red[300],
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
                color: Colors.green[300],
                child: Text(
                  'Ingresar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
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
                  'Registrarse',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registrar()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
