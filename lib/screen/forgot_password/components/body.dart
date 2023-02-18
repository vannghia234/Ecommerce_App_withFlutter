import 'package:ecommerce_app/widget/default_button.dart';
import 'package:ecommerce_app/widget/form_err.dart';
import 'package:ecommerce_app/widget/noAccountText.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../sign_in/components/customSuffixIcon.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const Text(
                'Forgot Password',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
              const Text(
                'Please enter your email and we will sent \nyou a link to return to your account',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const ForgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formkey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty == true &&
                  errors.contains(kEmailNullError)) {
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
              } else if (!emailValidatorRegExp.hasMatch(value!) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
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
          ),
          const SizedBox(
            height: 30,
          ),
          FormError(errors: errors),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formkey.currentState!.validate() == true) {
                _formkey.currentState?.save();
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const NoAccountText()
        ],
      ),
    );
  }
}
