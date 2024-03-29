import 'package:wildsnap/app/data/models/dto/response.dart';
import 'package:wildsnap/app/data/models/dto/user.dart';
import 'package:wildsnap/app/data/models/request/auth_request.dart';
import 'package:wildsnap/app/data/models/response/user_response.dart';
import 'package:wildsnap/app/data/values/urls.dart';
import 'package:wildsnap/base/base_reposiotry.dart';
import 'package:wildsnap/utils/helper/exception_handler.dart';

class UserRepository extends BaseRepositry {
  Future<RepoResponse<bool>> sendOTP(SendOTPRequest data) async {
    final response =
        await controller.post(path: URLs.sendOTP, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: true);
  }

  Future<RepoResponse<User?>> verifyOTP(VerifyOTPRequest data) async {
    final response =
        await controller.post(path: URLs.verifyOTP, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: UserResponse.fromJson(response).data);
  }

  Future<RepoResponse<User>> signUp(SignUpRequest data) async {
    final response =
        await controller.post(path: URLs.signUp, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: UserResponse.fromJson(response).data);
  }
}
