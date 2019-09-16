import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/user_model.dart';
import 'dart:async';

class Api {
  static const String BASE_URL = 'https://panic-api.herokuapp.com/';
  static const String LISTARUSER = BASE_URL +
      'users/'; //get agregar id para buscar usuario //para buscar contacto de usuario agregar id user y /contacts
  static const String REGISTRAR = BASE_URL + 'users'; //post
  static const String ACTUALIZAR_USUARIO =
      BASE_URL + 'users/'; //put falta agregar el id
  static const String ELIMINAR_USUARIO =
      BASE_URL + 'users/'; // metodo delete y agregar id usuario
  static const String NUEVO_CONTACTO =
      BASE_URL + 'users/'; //agregar id y /contacts

  static Future<dynamic> _get(String url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var code = response.statusCode;
        print(code);
        return convert.jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  static Future<dynamic> _post(String url) async {
    //arreglar para mandar json en metodo post en el video lo envian los datos por url
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        var code = response.statusCode;
        print(code);
        return convert.jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  static Future<dynamic> _login(String url, dynamic user) async {
    try {
      var userEnviar = convert.jsonEncode(user);
      var response = await http.post(url, body: userEnviar); //encode user json
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  static Future<List<dynamic>> getUserList() async {
    return await _get('${BASE_URL}users');
  }

  static Future<List<dynamic>> getReportList() async {
    return await _get('${BASE_URL}reports');
  }

  static Future<dynamic> getReport(String reportId) async {
    return await _get('${BASE_URL}reports/$reportId');
  }

  static Future<dynamic> newUser(String reportId) async {
    return await _post('${BASE_URL}users');
  }

  static Future<dynamic> Login(UserInfo user) async {
    return await _login('localhost:3000/users/login', user);
  }
}
