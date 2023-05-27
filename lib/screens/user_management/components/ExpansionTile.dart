// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:flutter/material.dart';

import 'package:ecommerce_app/configs/constant.dart';

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
  late final TextEditingController _textEditingController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExpansionTile(
        title: Text(widget.text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
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
                  decoration: const InputDecoration(
                      hintText: "Input your name",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
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
                    _isExpanded = false;
                  });
                  // String updatedValue = _textEditingController.text;
                  // Get.put(UserController().updateUserProfile(updatedValue));
                },
                child: const Text(
                  'Lưu',
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ],
      )
    ]);
  }
}
