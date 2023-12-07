import 'dart:convert';

import 'package:ecommerce_app/root.dart';
import 'package:ecommerce_app/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

import 'api/auth/login_account.dart';
import 'api/auth/register_account.dart';
import 'api/constant.dart';
import 'controller/get_cart_user_controller.dart';
import 'controller/login_account_info_controller.dart';

class AuthService extends GetxController {
  var isLoggedIn = false.obs;

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the requestA
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      isLoggedIn.value = true;

      final user = userCredential.user;
      Logger().i("USER INFO GG ${user?.displayName}");
      if (user != null) {
        // Lấy thông tin của user
        final displayName = user.displayName;
        print(displayName);
        final email = user.email;
        print(email);

        final photoUrl = user.photoURL;
        print(photoUrl);

        final uid = user.uid;
        print(uid);
        final sdt = user.phoneNumber;
        print(sdt);
        final response = await ApiLogin.login(email!, 'Nghiadz@12345');
        final userRes = response.data;
        Logger().i(
            'Response khi đăng nhập gg: ${response.data?.userStored?.avatarUrl}');

        if (userRes == null) {
          final res = await ApiRegister.register(
              fullname: displayName!,
              email: email,
              username: email,
              password: 'Nghiadz@12345',
              phone: sdt ?? "0378381905");
          Logger().i('logger đăng ký ${jsonEncode(res.data)}');
          Logger().i('logger đăng ký ${jsonEncode(res.message)}');
          final login = await ApiLogin.login(email, 'Nghiadz@12345');
          LoginAccountInfoController controller =
              Get.find<LoginAccountInfoController>();
          final cartController = Get.find<GetCartUserController>();
          final userData = login.data?.userStored;
          UserModel userToSaved = UserModel(
              id: userData?.id,
              email: userData?.email,
              fullname: userData?.fullname,
              phone: userData?.phone,
              username: userData?.username,
              avatarUrl: photoUrl);

          controller.setUser = userToSaved;
          controller.accessToken = response.data?.accessToken;
          controller.refreshToken = response.data?.refreshToken;
          controller.saveAccessToken();
          accesstokenn = response.data?.accessToken ?? "";
          await cartController.getCartUser(controller.user.id!);
          Get.to(() => const RootApp());
          return userCredential;
        }
        // Get.to(() => const RootApp());
        LoginAccountInfoController controller =
            Get.find<LoginAccountInfoController>();
        final cartController = Get.find<GetCartUserController>();

        final userData = response.data?.userStored;
        UserModel userToSaved = UserModel(
            id: userData?.id,
            email: userData?.email,
            fullname: userData?.fullname,
            phone: userData?.phone,
            username: userData?.username,
            avatarUrl: photoUrl);

        controller.setUser = userToSaved;
        Logger().i("USER INFO GG ${controller.user.email}}");

        controller.accessToken = response.data?.accessToken;
        controller.refreshToken = response.data?.refreshToken;
        controller.saveAccessToken();
        accesstokenn = response.data?.accessToken ?? "";
        await cartController.getCartUser(controller.user.id!);
        Get.to(() => const RootApp());

        // ...
      } else {
        print('Không tìm thấy thông tin người dùng!');
      }

      return userCredential;
    } catch (e) {
      Logger().i("Catch auth_service $e");
    }
    return null;
  }
}
