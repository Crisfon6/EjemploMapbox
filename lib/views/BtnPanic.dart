import 'package:flutter/material.dart';
import './Maps.dart';

class BtnPanic extends StatefulWidget {
  @override
  _BtnPanicState createState() => _BtnPanicState();
}

class _BtnPanicState extends State<BtnPanic> {
  var panic = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panic"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ClipOval(
                  child: Container(
                    color: Colors.red,
                    height: 120.0, // height of the button
                    width: 120.0, // width of the button
                    child: Center(
                      child: Text(
                        'Panic',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              RaisedButton(
                color: Colors.green,
                child: Text(
                  "Mapa",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MapaPage()))
                },
              )
            ]),
      ),
    );
  }
}
