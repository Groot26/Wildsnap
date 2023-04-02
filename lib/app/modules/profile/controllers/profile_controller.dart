import 'package:get/get.dart';
import 'package:wildsnap/app/data/models/dto/user.dart';
import 'package:wildsnap/app/data/values/strings.dart';
import 'package:wildsnap/utils/helper/text_field_wrapper.dart';
import 'package:wildsnap/utils/helper/validators.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';

class ProfileController extends GetxController {
  final nameWrapper = TextFieldWrapper();
  final userNameWrapper = TextFieldWrapper();
  final phoneWrapper = TextFieldWrapper();
  final emailWrapper = TextFieldWrapper();
  final dobWrapper = TextFieldWrapper();
  late final dob;

  late User profileDetails;


  @override
  void onInit() {
    profileDetails = Storage.getUser();
    super.onInit();
  }

  Future<void> signOut() async {

    await Storage.clearStorage();

  }

}
