import 'package:flutter/material.dart';

import '../../../constant.dart';
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
  @override
  void initState() {
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
    super.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
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
                focusNode: pin4FocusNode,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
                obscureText: true,
                onChanged: (value) {
                  pin4FocusNode.unfocus();
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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        DefaultButton(
          text: 'Continue',
          press: () {},
        )
      ],
    ));
  }
}
