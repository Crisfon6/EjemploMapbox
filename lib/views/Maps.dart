import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';




class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){},
          )
        ],
      ),
      body: _crearFlutterMap()
    );
  }

  Widget _crearFlutterMap(  ) {

    return FlutterMap(
      options: MapOptions(
        center: LatLng(7.1138959, -73.1054785),
        zoom: 15
      ),
      layers: [
        _crearMapa(),
      ],
    );

  }

  _crearMapa() {

    return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1IjoiY3Jpc2ZvbjYiLCJhIjoiY2swbWlsMjAzMTdvczNjcDdwMjFkcmNqdCJ9.ESku7AdI6kTKFJR33wOf6w',
        'id': 'mapbox.streets'
      }
    );


  }

}
