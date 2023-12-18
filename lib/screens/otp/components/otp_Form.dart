import 'package:ecommerce_app/controller/otp_controller.dart';
import 'package:ecommerce_app/screens/change-password-screen/change-password-screen.dart';
import 'package:ecommerce_app/screens/otp/changePassScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../configs/constant.dart';
import '../../../widget/default_button.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;
  late String otpValue;
  OtpController otp = Get.find<OtpController>();
  late bool isMatched;

  @override
  void initState() {
    isMatched = true;
    otpValue = "";
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      otpValue += value;
      focusNode?.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: controller1,
                autofocus: true,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
                obscureText: true,
                onChanged: (value) {
                  nextField(value, pin2FocusNode);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    focusedBorder: outlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor))),
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: controller2,
                focusNode: pin2FocusNode,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
                obscureText: true,
                onChanged: (value) {
                  nextField(value, pin3FocusNode);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: outlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor))),
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: controller3,
                focusNode: pin3FocusNode,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
                obscureText: true,
                onChanged: (value) {
                  nextField(value, pin4FocusNode);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: outlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor))),
              ),
            ),
            SizedBox(
              width: 60,
              child: TextFormField(
                controller: controller4,
                focusNode: pin4FocusNode,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
                obscureText: true,
                onChanged: (value) {
                  pin4FocusNode.unfocus();
                  otpValue = otpValue + value;
                  otp.otpCurrent.value = otpValue;
                  removeTextFieldOtp();

                  if (otp.otpCode.value == otp.otpCurrent.value) {
                    Get.to(() => const ChangePasswordScreen());
                  } else {
                    setState(() {
                      isMatched = false;
                    });
                  }
                  Logger().i("debug otp final is ${otp.otpCurrent.value}");
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: outlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: kTextColor))),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            isMatched ? "" : 'Mã xác minh không đúng',
            style: const TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        DefaultButton(
          text: 'Tiếp tục',
          press: () {
            removeTextFieldOtp();

            if (otp.otpCode.value == otp.otpCurrent.value) {
              setState(() {
                isMatched = true;
              });
              Get.to(() => const ChangePasswordScreen());
            } else {
              setState(() {
                isMatched = false;
              });
            }
          },
        )
      ],
    ));
  }

  void removeTextFieldOtp() {
    controller1.clear();
    controller2.clear();
    controller3.clear();
    controller4.clear();
    otpValue = "";
  }
}
