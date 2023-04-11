import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wildsnap/app/app.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

void main() async {
  await initGetStorage();
  ZIMKit().init(
    appID: 1024254277, //your appId
    appSign: '7b8365d663678f097d9d385366b90506fdde48779355b47e8b0596f2625e6e7e', // your appSign
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

Future initGetStorage() async {
  await GetStorage.init();
}
