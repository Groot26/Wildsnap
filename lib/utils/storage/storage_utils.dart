import 'package:get_storage/get_storage.dart';
import 'package:wildsnap/app/data/models/dto/user.dart';
import 'package:wildsnap/app/data/models/response/app_config_response.dart';

class Storage {
  Storage._privateConstructor();

  static final _box = GetStorage();

  static AppConfig getAppConfig() =>
      AppConfig.fromJson(_box.read(StorageKeys.APP_CONFIG));

  static void setAppConfig(AppConfig appConfig) =>
      _box.write(StorageKeys.APP_CONFIG, appConfig.toJson());

  static User getUser() => User.fromJson(_box.read(StorageKeys.USER));

  static Future<void> setUser(User? user) async =>
      await _box.write(StorageKeys.USER, user?.toJson());

  static Future<void> setToken(String? token) async =>
      await _box.write(StorageKeys.TOKEN, token);

  static String? getToken() => _box.read(StorageKeys.TOKEN);

  static bool isUserExists() => _box.read(StorageKeys.USER) != null;


  static Future<void> clearStorage() async => await _box.erase();
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const APP_CONFIG = 'app_config';
  static const USER = 'user';
  static const TOKEN = 'token';
}
