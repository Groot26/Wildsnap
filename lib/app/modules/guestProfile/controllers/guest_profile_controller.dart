import 'package:get/get.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';

import '../../../data/models/dto/user.dart';

class GuestProfileController extends GetxController {
  //TODO: Implement GuestProfileController

  late User profileDetails;

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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signOut() async {
    await Storage.clearStorage();
  }
}
