import 'package:get/get.dart';

class UserController extends GetxController {
  var name = ''.obs;

  void updateUserProfile(String newInput) {
    name.value = newInput;
    // call api to update user profile
  }
}