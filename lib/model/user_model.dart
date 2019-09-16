import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

class UserInfo {
  final String name;
  final String password;
  UserInfo(this.name, this.password);
}

Future<UserInfo> getUserInfo() async {
  String url = 'https://panic-api.herokuapp.com/users/5cc077693a1c2d2a58734fd6';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var data = jsonResponse[5];
    print("name : $data");
  } else {
    print("request failed: ${response.statusCode}");
  }
}

Future<dynamic> login(UserInfo) async {
  String url = 'https://panic-api.herokuapp.com/users/5cc077693a1c2d2a58734fd6';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var data = jsonResponse[5];
    print("name : $data");
  } else {
    print("request failed: ${response.statusCode}");
  }
}

class User {
  final double longitude;
  final double latitude;
  final String state;
  final Map<String, int> contacts;
  final String id;
  final String name;
  final int cellphone;
  final String password;
  final DateTime date;

  User(
      {this.longitude,
      this.latitude,
      this.state,
      this.contacts,
      this.id,
      this.name,
      this.cellphone,
      this.password,
      this.date});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      longitude: json['longitude'],
      latitude: json['latitude'],
      state: json['state'],
      contacts: json['contacts'],
      id: json['_id'],
      name: json['name'],
      cellphone: json['cellphone'],
      password: json['password'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'longitude': longitude,
        'latitude': latitude,
        'state': state,
        'contacts': contacts,
        '_id': id,
        'name': name,
        'cellphone': cellphone,
        'password': password,
        'date': date,
      };
}
