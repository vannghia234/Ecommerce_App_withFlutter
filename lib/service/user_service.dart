import 'package:ecommerce_app/api/user/fetch_api_service.dart';
import 'package:ecommerce_app/models/change_pass_response.dart';
import 'package:ecommerce_app/models/update_user_response.dart';

class UserService {
  static final UserService instance = UserService._internal();
  factory UserService() {
    return instance;
  }

  UserService._internal();

  Future<UpdateUserResponse?> updateUser(
      String userName, String fullname, String email, String phone) {
    return FetchApiUserService.instance
        .updateUser(userName, fullname, email, phone);
  }

  Future<ChangePassResponse?> changePass(
      String userId, String oldPass, String newPass) {
    return FetchApiUserService.instance.changePass(userId, oldPass, newPass);
  }
}
