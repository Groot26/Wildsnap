import 'dart:convert';
import 'package:get/get.dart';
import 'package:wildsnap/app/modules/search/controllers/search_controller.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/loading/loading_utils.dart';
import '../../../data/models/dto/user.dart';
import '../../home/controllers/home_controller.dart';

class GuestProfileController extends GetxController {
  //TODO: Implement GuestProfileController

  late User profileDetails;
  final searchController = Get.find<SearchController>();
  RxList<Post> postsDash = RxList([]);

  @override
  void onInit() {
    profileDetails = Storage.getUser();
    print(profileDetails.followersCount.toString());
    print(profileDetails.followingCount.toString());
    print(profileDetails.id.toString());
    //print(profileDetails.token.toString());
    print(profileDetails.name.toString());

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getPost();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getPost() async {

    final guestUserid = searchController.posts[Get.arguments['index']].id;
    print(guestUserid);
    LoadingUtils.showLoader();
    var url = Uri.parse('http://3.109.185.64:3001/api/post/user/$guestUserid');

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

  Future followUnfollow() async {

    final guestUserid = searchController.posts[Get.arguments['index']].id;
    print(guestUserid);
    var url = Uri.parse('http://3.109.185.64:3001/api/user/$guestUserid/follow-unfollow');

    http.Response response = await http.post(
      url,
      headers: {'Authorization': 'Bearer ${Storage.getToken()}'},
    );

    print('Response status: ${response.statusCode}');
    if(response.statusCode==201)
      Get.snackbar('Follow Unfollow ','Successful');
    else
      Get.snackbar('Something went Wrong', '');
  }

}
