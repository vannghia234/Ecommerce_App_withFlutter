import 'package:ecommerce_app/controller/auth_controller.dart';
import 'package:ecommerce_app/screens/forgot_password/otp_screen.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:ecommerce_app/widget/form_err.dart';
import 'package:ecommerce_app/widget/noAccountText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../configs/constant.dart';
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
                'Please enter your phone and we will sent \nyou a otp to return to your account',
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
  final otpController = Get.put(OTPController());
  final firebaseController = Get.put(FirebaseAuthController());
  List<String> errors = [];
  String? phone;
  var countrycode = '+84';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) => phone = newValue,
            onChanged: (value) {
              if (value.isNotEmpty == true && errors.contains(kUserNullError)) {
                setState(() {
                  errors.remove(kUserNullError);
                });
              }
              // else if (emailValidatorRegExp.hasMatch(value) &&
              //     errors.contains(kInvalidEmail)) {
              //   setState(() {
              //     errors.remove(kInvalidEmail);
              //   });
              // }
              phone = value;
            },
            validator: (value) {
              if (value?.isEmpty == true && !errors.contains(kUserNullError)) {
                setState(() {
                  errors.add(kUserNullError);
                });
              }
              // else if (!emailValidatorRegExp.hasMatch(value!) &&
              //     !errors.contains(kInvalidEmail)) {
              //   setState(() {
              //     errors.add(kInvalidEmail);
              //   });
              // }
              return null;
            },
            keyboardType: TextInputType.phone,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
                hintText: 'Enter your phone',
                labelText: 'Phone Number',
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
            text: 'Send OTP',
            press: () async {
              if (_formkey.currentState!.validate() == true) {
                _formkey.currentState?.save();
              }
              await firebaseController.phoneSendOtp(phone!);
              Get.to(() => OTPScreen(phone));
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
