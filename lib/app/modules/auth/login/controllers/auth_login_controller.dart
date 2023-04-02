
import 'package:wildsnap/app/data/repository/user_repository.dart';
import 'package:wildsnap/app/data/values/strings.dart';
import 'package:wildsnap/app/modules/auth/login/controllers/ApiService.dart';
import 'package:wildsnap/app/modules/dashboard/views/dashboard_view.dart';
import 'package:wildsnap/base/base_controller.dart';
import 'package:wildsnap/utils/helper/text_field_wrapper.dart';
import 'package:wildsnap/utils/helper/validators.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wildsnap/utils/storage/storage_utils.dart';

class AuthLoginController extends BaseController<UserRepository> {
  final emailWrapper = TextFieldWrapper();
  final passWrapper = TextFieldWrapper();


  //MARK:API Call
  callLoginApi() {
    final service = ApiServices();

    service.apiCallLogin(
      {
        "email": emailWrapper.controller.text,
        "password": passWrapper.controller.text,
      },
    ).then((value) {
      if (value.error != null) {
        print("get data >>>>>> " + value.error!);
        passWrapper.errorText = ErrorMessages.incorrectPassword;
      } else {
        print("*********************************************************");
        Storage.setUser(value.data);
        print('---user ' + value.data!.toString());
        DashboardView.launch();
      }
    }
    );
  }


  sendOTP() async {

    String email = emailWrapper.controller.text.trim();
    if (email.isValidEmail()) {
      emailWrapper.errorText = Strings.empty;
    } else {
      emailWrapper.errorText = ErrorMessages.invalidEmail;
      return;
    }

    String password = passWrapper.controller.text;
    if (password.isEmpty) {
      passWrapper.errorText = ErrorMessages.incorrectPassword;
    }

    callLoginApi();
  }
}
