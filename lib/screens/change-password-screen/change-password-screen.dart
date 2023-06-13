import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/root.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../configs/constant.dart';
import '../../controller/update-info-controller.dart';
import '../../service/user_service.dart';

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
      var response = await UserService.instance
          .changePass(infoController.user!.id!, oldPassword!, newPassword!);
      Logger().i('test');
      Logger().i(response!.message!);
      if (response.message == 'Pass user Wrong!') {
        setState(() {
          if (!errors.contains(kInvalidUsernamePassword)) {
            errors.add(kInvalidUsernamePassword);
          }
          if (errors.contains(kExistAccount)) {
            errors.remove(kExistAccount);
          }
        });
        Get.back();

        return;
      }
    }
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('Password updated successfully')),
    // ); chổ này dùng GetX
    Get.showSnackbar(const GetSnackBar(
      title: "Thông báo",
      message: "Bạn đã cập nhật mật khẩu thành công",
    ));
    Get.offAll(() => const RootApp());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if (value == null || value.isEmpty) {
                    return 'Please enter old password'; 
                  } else if (value.length < 8) {
                    return 'Password must be at least 8 characters'; 
                  }
                  return null;
                },
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
