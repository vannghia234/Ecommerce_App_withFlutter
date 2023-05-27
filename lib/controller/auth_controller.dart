import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  RxString username = ''.obs;
  RxString password = ''.obs;
  RxBool isRemember = false.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getSavedCredentials();
  }

  Future<void> getSavedCredentials() async {
    if (box.hasData('username') &&
        box.hasData('password') &&
        box.hasData('isRemember')) {
      username.value = box.read('username');
      password.value = box.read('password');
      isRemember.value = box.read('isRemember');
    }
  }

  Future<void> saveCredentials(
      String username, String password, bool rememberMe) async {
    await box.write('username', username);
    await box.write('password', password);
    await box.write('isRemember', rememberMe);
    this.username.value = username;
    this.password.value = password;
    isRemember.value = rememberMe;
  }
}
