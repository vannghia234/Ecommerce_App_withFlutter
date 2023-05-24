import 'package:ecommerce_app/api/auth/login_account.dart';
import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce_app/root.dart';
import 'package:ecommerce_app/screens/sign_in/components/customSuffixIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/default_button.dart';
import '../../../widget/form_err.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late LoginAccountInfoController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = Get.put(LoginAccountInfoController());
  }

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        buildEmailField(),
        const SizedBox(
          height: 30,
        ),
        buildPasswordField(),
        const SizedBox(
          height: 30,
        ),
        FormError(errors: errors),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Checkbox(
              value: remember,
              onChanged: (value) {
                setState(() {
                  remember = value!;
                });
              },
            ),
            const Text('Remember me'),
            const Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
              child: const Text(
                'Forgot Password',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        DefaultButton(
          text: 'Tiếp tục ',
          press: () async {
            if (_formKey.currentState!.validate() == true) {
              _formKey.currentState?.save();
              final response = await ApiLogin.login(email!, password!);
              if (response.message == 'Incorrect account or password') {
                setState(() {
                  if (!errors.contains(kInvalidUsernamePassword)) {
                    errors.add(kInvalidUsernamePassword);
                  }
                  if (errors.contains(kExistAccount)) {
                    errors.remove(kExistAccount);
                  }
                });
                return;
              } else if (response.message == 'User not found') {
                setState(() {
                  if (!errors.contains(kExistAccount)) {
                    errors.add(kExistAccount);
                  }
                  if (errors.contains(kInvalidUsernamePassword)) {
                    errors.remove(kInvalidUsernamePassword);
                  }
                });
                return;
              }
              final userData = response.data?.userStored;
              User user = User(
                  id: userData?.id,
                  email: userData?.email,
                  fullname: userData?.fullname,
                  phone: userData?.phone,
                  username: userData?.username,
                  avatarUrl: userData?.avatarUrl);
              controller.setUser = user;
              controller.accessToken = response.data?.accessToken;
              controller.refreshToken = response.data?.refreshToken;

              Get.toNamed(RootApp.routeName);
            }
          },
        ),
      ]),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty == true && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value?.isEmpty == true && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return "";
        } else if (value!.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return "";
        }
        return null;
      },
      onSaved: (newValue) => password = newValue,
      obscureText: true,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
          hintText: 'Enter your password',
          labelText: 'Password',
          suffixIcon: CustomSuffix(
            svgIcon: 'assets/icons/Lock.svg',
          )),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty == true && errors.contains(kUserNullError)) {
          setState(() {
            errors.remove(kUserNullError);
          });
        }
      },
      validator: (value) {
        if (value?.isEmpty == true && !errors.contains(kUserNullError)) {
          setState(() {
            errors.add(kUserNullError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
          hintText: 'Enter your username',
          labelText: 'Username',
          suffixIcon: CustomSuffix(
            svgIcon: 'assets/icons/User.svg',
          )),
    );
  }
}
