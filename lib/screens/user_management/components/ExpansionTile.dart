// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field
import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/controller/update-info-controller.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/configs/constant.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../root.dart';
import '../../../widget/show_loading_animation.dart';

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
  final updateController = Get.put(UserController());
  final userController = Get.find<LoginAccountInfoController>();

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text),
            Text(widget.name),
          ],
        ),
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
                      hintText: "Input your ${widget.name}",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20)),
                ),
              ),
              Container(
                width: 1.5,
                height: 20,
                color: Colors.black,
              ),
              TextButton(
                onPressed: () async {
                  try {
                    showLoadingAnimation(context);
                    if (widget.text == 'Tên') {
                      if (userController.user != null) {
                        await updateController.updateUserProfile(
                          userController.user!.username!,
                          _textEditingController.text,
                          userController.user!.email!,
                          userController.user!.phone!,
                        );
                        userController.user!.fullname =
                            _textEditingController.text;
                        userController.update();
                      }
                    } else if (widget.text == 'Số điện thoại') {
                      if (userController.user != null) {
                        await updateController.updateUserProfile(
                          userController.user!.username!,
                          userController.user!.fullname!,
                          userController.user!.email!,
                          _textEditingController.text,
                        );
                        userController.user!.phone =
                            _textEditingController.text;
                        userController.update();
                      }
                    } else {
                      if (userController.user != null) {
                        await updateController.updateUserProfile(
                          userController.user!.username!,
                          userController.user!.fullname!,
                          _textEditingController.text,
                          userController.user!.phone!,
                        );
                        userController.user!.email =
                            _textEditingController.text;
                        userController.update();
                      }
                    }
                    User user = User(
                        id: userController.user?.id,
                        email: userController.user?.email,
                        fullname: userController.user?.fullname,
                        phone: userController.user?.phone,
                        username: userController.user?.username,
                        avatarUrl: userController.user?.avatarUrl);
                    userController.setUser = user;
                    Logger().i(userController);
                    Get.back();
                    Get.offNamed(RootApp.routeName);
                  } catch (e) {
                    throw Exception(e);
                  }
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
