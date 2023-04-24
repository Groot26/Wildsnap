import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wildsnap/utils/helper/text_field_wrapper.dart';
import 'package:http/http.dart' as http;
import 'package:wildsnap/utils/storage/storage_utils.dart';

class PostPreviewController extends GetxController {
  final captionWrapper = TextFieldWrapper();
  final latWrapper = TextFieldWrapper();
  final longWrapper = TextFieldWrapper();

  Rx<File?> imageFile = Rx(null);

  void getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  getLocation() async {
    // final location = Location();
    // locationData = await location.getLocation();
    // print('Lat: ${locationData.latitude}, Long: ${locationData.longitude}');
    latWrapper.controller.text = '16.002748';
    longWrapper.controller.text = '73.688986';
    print(imageFile);
  }

  Future post(Post model) async {
    // final response = await dio.get('https://dart.dev');
    // print(response);

    final url = Uri.parse('http://3.109.185.64:3001/api/post');

    print(model.toJson());
    print(Storage.getToken());
    http.Response response = await http.post(url,
        headers: {
          'Authorization': 'Bearer ${Storage.getToken()}',
          'Content-Type': 'application/json'
        },
        body: json.encode(model.toJson()));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('------Post Successful---------');

    //Get.back();
  }

  Future uploadImage() async {
    if (imageFile.value != null) {
      var uri = Uri.parse('http://3.109.185.64:3001/api/s3/upload');

      final response = await http.post(uri,
          body: imageFile.value!.readAsBytesSync(),
          headers: {
            'Authorisation': 'Bearer ${Storage.getToken()}',
            'Content-Type': 'image/jpg'
          });

      //http.FormData formData = http.FormData.fromMap(map);

      // var request = http.MultipartRequest('POST', uri)
      //   ..files.add(
      //     await http.MultipartFile.fromPath(
      //       'file',
      //       imageFile.value!.path,
      //       //contentType: MediaType('application', 'x-tar'),
      //     ),
      //   );
      print(response.body.toString());

      if (response.statusCode == 200) {
        print(response);
      }
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }
}

class Post {
  String caption;
  String image;
  Location location;

  Post({
    required this.caption,
    required this.image,
    required this.location,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['imageUrl'] = this.image;
    data['location'] = this.location.toJson();
    return data;
  }
}

class Location {
  String lat;
  String lng;

  Location({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
