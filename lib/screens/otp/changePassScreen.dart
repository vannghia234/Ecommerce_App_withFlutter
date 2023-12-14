import 'package:ecommerce_app/api/user/push_api_service.dart';
import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/models/UserResponse.dart';
import 'package:ecommerce_app/models/change_pass_response.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/service/user_service.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:ecommerce_app/widget/show_loading_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  String? newPassword;
  String? confirmPassword;

  final List<String> errors = [];
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  void initState() {
    newPassword = "";
    confirmPassword = "";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Cập nhật mật khẩu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.05),
              const Text(
                "Cập nhật mật khẩu của bạn",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              SizedBox(height: Get.height * 0.05),
              TextFormField(
                style: const TextStyle(fontSize: 16),
                onSaved: (newValue) => newPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "nhập mật khẩu mới",
                  errorStyle: TextStyle(fontSize: 14),
                  labelText: 'Mật khẩu mới',
                ),
                onChanged: (value) {
                  newPassword = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu mới';
                  } else if (value.length < 8) {
                    return 'Mật khẩu phải có ít nhất 8 kí tự';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                style: const TextStyle(fontSize: 16),
                onSaved: (newValue) => confirmPassword,
                obscureText: true,
                onChanged: (value) {
                  confirmPassword = value;
                },
                decoration: const InputDecoration(
                  hintText: "nhập lại mật khẩu",
                  labelText: 'Xác nhận mật khẩu',
                  errorStyle: TextStyle(fontSize: 14),
                ),
                validator: (value) {
                  if (value != newPassword && newPassword!.isNotEmpty) {
                    return 'Mật khẩu không trùng khớp';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),
              DefaultButton(
                text: 'Thay đổi mật khẩu',
                press: () async {
                  final infoController = Get.find<LoginAccountInfoController>();
                  if (formKey.currentState!.validate() == true) {
                    formKey.currentState?.save();
                    showLoadingAnimationTabbar(context);
                    UserResponse? response;
                    try {
                      Logger().i("userId  ${infoController.user.id!}");
                      response = await PushApiUserService.instance
                          .updateUserNewPassord(
                              newPassword!, infoController.user.id!);
                      Logger().i(response!.message!);
                    } catch (e) {
                      Logger().i("userId  $e");
                      Get.back();
                    }
                    Get.back();
                    if (response?.status == 'Success') {
                      Get.snackbar(
                          'Thông báo', "Bạn đã đổi mật khẩu thành công",
                          icon: const Icon(Icons.check_box),
                          shouldIconPulse: true,
                          isDismissible: true,
                          titleText: const Text(
                            'Thông báo',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ));
                      Get.offAll(() => const SignInScreen());
                    } else {
                      Get.snackbar('Thông báo', "Something was wrong",
                          icon: const Icon(Icons.notification_important),
                          shouldIconPulse: true,
                          isDismissible: true,
                          titleText: const Text(
                            'Thông báo',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ));
                      Get.offAll(() => const SignInScreen());
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
