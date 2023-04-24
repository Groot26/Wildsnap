import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wildsnap/utils/helper/text_field_wrapper.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';

class SearchController extends GetxController {
  final searchWrapper = TextFieldWrapper();
  RxList<SearchUser> posts = RxList([]);

  Future searchUser(String? query) async {
    var url = Uri.parse('http://3.109.185.64:3001/api/user?query=$query');

    http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${Storage.getToken()}'},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    posts.value = List<SearchUser>.from(
        data.map((dynamic row) => SearchUser.fromJson(row)));
  }
}

class SearchUser {
  String name;
  String image;
  String userName;
  String id;
  String phone;
  String email;
  int followers;
  int following;
  String dob;

  SearchUser({
    required this.name,
    required this.image,
    required this.userName,
    required this.dob,
    required this.id,
    required this.email,
    required this.phone,
    required this.followers,
    required this.following,
  });

  factory SearchUser.fromJson(Map<String, dynamic> json) {
    return SearchUser(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
      image: json['imageUrl'],
      email: json['email'],
      dob: json['dob'],
      phone: json['phone'],
      followers: json['followers'],
      following: json['following'],
    );
  }
}
