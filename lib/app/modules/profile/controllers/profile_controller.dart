import 'dart:convert';
import 'package:get/get.dart';
import 'package:wildsnap/app/data/models/dto/user.dart';
import 'package:wildsnap/utils/helper/text_field_wrapper.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/loading/loading_utils.dart';
import '../../home/controllers/home_controller.dart';

class ProfileController extends GetxController {
  final nameWrapper = TextFieldWrapper();
  final userNameWrapper = TextFieldWrapper();
  final phoneWrapper = TextFieldWrapper();
  final emailWrapper = TextFieldWrapper();
  final dobWrapper = TextFieldWrapper();
  late final dob;

  late User profileDetails;
  RxList<Post> postsDash = RxList([]);

  @override
  void onInit() {
    profileDetails = Storage.getUser();
    print('followersCount'+profileDetails.followersCount.toString());
    print('followingCount'+profileDetails.followingCount.toString());
    print(profileDetails.name.toString());
    super.onInit();
  }

  @override
  void onReady() async {
    await getPost();
    super.onReady();
  }

  Future<void> signOut() async {

    await Storage.clearStorage();

  }

  Future getPost() async {
    LoadingUtils.showLoader();
    var url = Uri.parse('http://3.109.185.64:3001/api/post/user/${Storage.getUser().id}');

    http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${Storage.getToken()}'},
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List<dynamic> data = jsonDecode(response.body);

    print(data);

    data.forEach((element) {
      postsDash.add(Post.fromJson(element));
    });
    LoadingUtils.hideLoader();
  }

}
