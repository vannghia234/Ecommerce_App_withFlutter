import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/screen/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce_app/screen/login_success/loginSuccess.dart';
import 'package:ecommerce_app/screen/sign_in/components/customSuffixIcon.dart';
import 'package:flutter/material.dart';

import '../../../widget/default_button.dart';
import '../../../widget/form_err.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
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
          text: 'Continue',
          press: () {
            if (_formKey.currentState!.validate() == true) {
              _formKey.currentState?.save();
              Navigator.pushNamed(context, LoginSuccessScreen.routeName);
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
      keyboardType: TextInputType.emailAddress,
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
        if (value.isNotEmpty == true && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value?.isEmpty == true && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value!) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return "";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
          hintText: 'Enter your mail',
          labelText: 'Email',
          suffixIcon: CustomSuffix(
            svgIcon: 'assets/icons/Mail.svg',
          )),
    );
  }
}
