import 'package:wildsnap/app/data/models/dto/user.dart';

class UserResponse {
  late User? data;
  late String token;
  //late int statusCode;

  UserResponse({required this.data,required this.token }); //required this.statusCode

  UserResponse.fromJson(Map<String, dynamic> json) {
    this.data = json['user'] == null ? null : User.fromJson(json['user']);
    this.token = json['token'];
    //this.statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = this.data?.toJson();
    //data['statusCode'] = this.statusCode;
    return data;
  }
}
