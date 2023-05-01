import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wildsnap/app/modules/postPreview/controllers/post_preview_controller.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';

import '../../../../utils/loading/loading_utils.dart';
import '../../../data/models/dto/user.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  RxBool isLiked = false.obs;
  RxBool isLiked2 = false.obs;

  RxList<Post> postsDash = RxList([]);

  @override
  Future<void> onReady()  async {
    await getPost();
    super.onReady();
  }


  Future getPost() async {
    LoadingUtils.showLoader();
    var url = Uri.parse('http://3.109.185.64:3001/api/post/dashboard');

    http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${Storage.getToken()}'},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List<dynamic> data = jsonDecode(response.body);

   data.forEach((element) {
   postsDash.add(Post.fromJson(element));
   });
    LoadingUtils.hideLoader();
  }
}


class Post {
  final User? user;
  final String id;
  final String imageUrl;
  final String caption;
  final Location location;

  Post({
     this.user,
    required this.id,
    required this.imageUrl,
    required this.caption,
    required this.location,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      user: json['user']!=null? User.fromJson(json['user']):null,
      id: json['id'],
      imageUrl: json['imageUrl'],
      caption: json['caption'],
      location: Location.fromJson(json['location']),
    );
  }
}



