import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wildsnap/app/data/models/dto/user.dart';


class ApiServices{

  Future <LoginApiResponse> apiCallLogin(Map<String,dynamic> param) async{

    var url = Uri.parse('http://3.109.185.64:3001/api/auth/login');
    var response = await http.post(url, body: param);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    final user = User.fromJson(data['user']);
    return LoginApiResponse(token: data["token"], error: data["error"],data: user );
  }
}


class LoginApiResponse{
  final String? token;
  final User? data;
  final String? error;

  LoginApiResponse( {this.token,this.error,this.data});
}