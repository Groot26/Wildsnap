import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';

import '../../../../utils/helper/text_field_wrapper.dart';
import '../../../data/models/dto/user.dart';

class CommentsController extends GetxController {
  //TODO: Implement CommentsController
  final comments = TextEditingController();
  late User profileDetails;

  final count = 0.obs;
  @override
  void onInit() {
    profileDetails = Storage.getUser();
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

  void increment() => count.value++;
}
