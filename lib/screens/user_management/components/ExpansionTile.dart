// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:ecommerce_app/controller/update-info-controller.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/configs/constant.dart';
import 'package:get/get.dart';

class dropDownInfo extends StatefulWidget {
  const dropDownInfo({
    Key? key,
    required this.name,
    required this.text,
  }) : super(key: key);

  final String text, name;

  @override
  State<dropDownInfo> createState() => _dropDownInfo();
}

class _dropDownInfo extends State<dropDownInfo> {
  bool _isExpanded = false;
  final String _textValue = '';
  final TextEditingController _textEditingController =
      Get.put(TextEditingController());
  final UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExpansionTile(
        title: Text(widget.text),
        textColor: kPrimaryColor,
        trailing: AnimatedRotation(
          turns: _isExpanded ? 0.25 : 0,
          duration: const Duration(milliseconds: 200),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: _isExpanded ? kPrimaryColor : Colors.black,
          ),
        ),
        onExpansionChanged: (bool value) {
          setState(() {
            _isExpanded = value;
          });
        },
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: _userController.name.toString(),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                ),
              ),
              Container(
                width: 1.5,
                height: 20,
                color: Colors.black,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isExpanded:
                    false;
                  });
                  // String updatedValue = _textEditingController.text;
                  // Get.put(UserController().updateUserProfile(updatedValue));
                },
                child: const Text('Lưu'),
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
