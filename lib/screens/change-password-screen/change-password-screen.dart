import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:ecommerce_app/widget/show_loading_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../configs/constant.dart';
import '../../controller/update-info-controller.dart';
import '../../service/user_service.dart';
import '../sign_in/sign_in_screen.dart';

class UpdatePasswordScreen extends StatefulWidget {
  static String routeName = '/change_password';

  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String? password;
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  final infoController = Get.find<LoginAccountInfoController>();

  final userController = Get.find<UserController>();

  final List<String> errors = [];

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate() == true) {
      _formKey.currentState!.save();
      showLoadingAnimationTabbar(context);
      var response = await UserService.instance
          .changePass(infoController.user.id!, oldPassword!, newPassword!);
      Logger().i(response!.message!);
      Get.back();
      if (response.message == 'Pass user Wrong!') {
        Get.snackbar('Thông báo', "Mật khẩu cũ không chính xác",
            icon: const Icon(Icons.notification_important),
            shouldIconPulse: true,
            isDismissible: true,
            titleText: const Text(
              'Thông báo',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
            ));
        return;
      }
      Get.snackbar('Thông báo', "Bạn đã đổi mật khẩu thành công",
          icon: const Icon(Icons.notification_important),
          shouldIconPulse: true,
          isDismissible: true,
          titleText: const Text(
            'Thông báo',
            style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
          ));
      Get.offAll(() => const SignInScreen());
    }

    // Get.offAll(() => const RootApp());
  }

  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Update Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onSaved: (newValue) => oldPassword = newValue,
                obscureText: true,
                onChanged: (value) {
                  oldPassword = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Old Password',
                ),
                validator: (value) {
                  if (value?.isEmpty == true &&
                      !errors.contains(kPassNullError)) {
                    setState(() {
                      errors.add(kPassNullError);
                    });
                    return "";
                  } else if (value!.length < 8 &&
                      !errors.contains(kShortPassError)) {
                    setState(() {
                      errors.add(kShortPassError);
                    });
                    return "";
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  ...List.generate(
                      errors.length, (index) => Text(errors[index]))
                ],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onSaved: (newValue) => newPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                ),
                onChanged: (value) {
                  newPassword = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter old password';
                  } else if (value.length < 8) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onSaved: (newValue) => confirmPassword,
                obscureText: true,
                onChanged: (value) {
                  confirmPassword = value;
                },
                decoration:
                    const InputDecoration(labelText: 'Confirm New Password'),
                validator: (value) {
                  if (value != newPassword) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),
              DefaultButton(
                text: 'Update Password',
                press: () async => {
                  _submitForm(context),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
