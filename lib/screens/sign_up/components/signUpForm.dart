import 'package:ecommerce_app/screens/complete_profile/complete_profile.dart';
import 'package:flutter/material.dart';

import '../../../configs/constant.dart';
import '../../../widget/default_button.dart';
import '../../../widget/form_err.dart';
import '../../sign_in/components/customSuffixIcon.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? confirmPassword;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        BuildUsername(),
        const SizedBox(
          height: 20,
        ),
        BuildFormPassword(),
        const SizedBox(
          height: 20,
        ),
        BuildConfirmPassword(),
        FormError(errors: errors),
        const SizedBox(
          height: 40,
        ),
        DefaultButton(
          text: 'Tiếp tục',
          press: () {
            if (_formKey.currentState!.validate() == true) {
              _formKey.currentState?.save();
              Navigator.pushNamed(context, CompleteProfileScreen.routeName,
                  arguments: {'username': username, 'password': password});
            }
          },
        )
      ]),
    );
  }

  TextFormField BuildConfirmPassword() {
    return TextFormField(
      onChanged: (value) {
        if (password == confirmPassword) {
          setState(() {
            errors.remove(kMatchPassError);
          });
        }
      },
      validator: (value) {
        if (value?.isEmpty == true) {
          return "";
        } else if (password != confirmPassword &&
            !errors.contains(kMatchPassError)) {
          setState(() {
            errors.add(kMatchPassError);
          });
          return "";
        }
        return null;
      },
      onSaved: (newValue) => confirmPassword = newValue,
      obscureText: true,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
          hintText: 'Re-enter your password',
          labelText: 'Confirm password',
          suffixIcon: CustomSuffix(
            svgIcon: 'assets/icons/Lock.svg',
          )),
    );
  }

  TextFormField BuildFormPassword() {
    return TextFormField(
      onChanged: (value) {
        password = value;
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

  TextFormField BuildUsername() {
    return TextFormField(
      onSaved: (newValue) => username = newValue,
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
