import 'package:wildsnap/app/data/models/response/app_config_response.dart';
import 'package:wildsnap/app/data/values/urls.dart';
import 'package:wildsnap/base/base_reposiotry.dart';
import 'package:wildsnap/utils/helper/exception_handler.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';

class ConfigRepository extends BaseRepositry {
  saveAppConfig() async {
    final response = await controller.get(path: URLs.appConfig);
    if (!(response is APIException))
      Storage.setAppConfig(AppConfigResponse.fromJson(response).data);
  }
}
