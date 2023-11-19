// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class LoginAccountInfoController extends GetxController {
  @override
  void onInit() {
    getAccessToken();
    super.onInit();
  }

  // lưu trữ thông tin account
  var _accessToken = "";
  var _refreshToken = "";
  UserModel user = UserModel();
  final box = GetStorage();

  get accessToken => _accessToken;

  set accessToken(final value) => _accessToken = value;

  get refreshToken => _refreshToken;

  set refreshToken(value) => _refreshToken = value;

  get getUser => user;

  set setUser(user) => this.user = user;

  Future<void> saveAccessToken() async {
    await box.write('accessToken', accessToken);
    await box.write('refreshToken', refreshToken);
  }

  Future removeToken(String key) async {
    await box.remove(key);
  }

  Future getAccessToken() async {
    if (box.hasData('accessToken') && box.hasData('refreshToken')) {
      accessToken = box.read('accessToken');
      refreshToken = box.read('refreshToken');
      Logger().i('access token khi log get storage' + accessToken);
    }
  }
}
