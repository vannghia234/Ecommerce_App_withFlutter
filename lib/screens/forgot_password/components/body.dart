import 'package:ecommerce_app/api/user/push_api_service.dart';
import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/controller/otp_controller.dart';
import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:ecommerce_app/utils/email_service.dart';
import 'package:ecommerce_app/widget/default_button.dart';
import 'package:ecommerce_app/widget/form_err.dart';
import 'package:ecommerce_app/widget/noAccountText.dart';
import 'package:ecommerce_app/widget/show_loading_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../configs/constant.dart';
import '../../sign_in/components/customSuffixIcon.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());
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
                'Quên mật khẩu',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black),
              ),
              const Text(
                'Vui lòng điền email của bạn mã xác nhận\n sẽ gửi đến bạn để khôi phục tài khoản.',
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
  String email = "";
  bool isvalid = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) async {
              email = value;
              if (value.isNotEmpty == true && errors.contains(kEmailError)) {
                setState(() {
                  errors.remove(kEmailError);
                });
              }
              if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmail)) {
                setState(() {
                  errors.remove(kInvalidEmail);
                });
              }
            },
            validator: (value) {
              if (value?.isEmpty == true && !errors.contains(kEmailError)) {
                setState(() {
                  errors.add(kEmailError);
                });
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value!) &&
                  !errors.contains(kInvalidEmail)) {
                setState(() {
                  errors.add(kInvalidEmail);
                });
                return "";
              } else if (errors.isNotEmpty) {
                return "";
              }
              return null;
            },
            cursorColor: Colors.black,
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
                hintText: 'Vui lòng nhập email',
                labelText: 'Email',
                suffixIcon: CustomSuffix(
                  svgIcon: 'assets/icons/Mail.svg',
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              isvalid ? "" : "Địa chỉ email này không tồn tại",
              style: const TextStyle(color: Colors.red, fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          FormError(errors: errors),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          DefaultButton(
            text: 'Tiếp tục',
            press: () async {
              if (_formkey.currentState!.validate() == true) {
                _formkey.currentState?.save();
                final infoController = Get.find<LoginAccountInfoController>();
                showLoadingAnimationTabbar(context);
                var res =
                    await PushApiUserService.instance.getUserByEmail(email);
                if (res?.status == "Success") {
                  infoController.user.id = res!.data?.id;
                  setState(() {
                    isvalid = true;
                  });
                  OtpController otp = Get.find<OtpController>();
                  otp.email.value = email;
                  Logger().i(otp.email);
                  OtpController controllerOtp = Get.find<OtpController>();
                  EmailService sv = EmailService();
                  controllerOtp.otpCode.value = sv.GenerateOtpCode();

                  await sv.sendOtpEmail(email, controllerOtp.otpCode.value);
                  sv.toEmail = email;
                  Get.back();
                  Logger().i("otpcode is ${controllerOtp.otpCode.value}");
                  Get.to(() => const OtpScreen());
                } else {
                  setState(() {
                    isvalid = false;
                  });
                  Get.back();
                }
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
