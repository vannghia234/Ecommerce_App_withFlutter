import 'dart:async';
import 'dart:convert';

import 'package:ecommerce_app/configs/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/controller/chat_controller.dart';
import 'package:ecommerce_app/user_model.dart';
import 'package:logger/logger.dart';

import '../../controller/login_account_info_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Message {
  final String email;
  final String text;

  Message(this.email, this.text);
}

class HomeController extends GetxController {
  final msgBoxController = TextEditingController();
  final messages = <Message>[].obs;
  final messageController = Get.find<ChatMessageController>();
  final userController = Get.find<LoginAccountInfoController>();
}

class ChatPage extends GetView {
  ChatPage({super.key});

  final userController = Get.find<LoginAccountInfoController>();
  final messageController = Get.find<ChatMessageController>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Timer.periodic(const Duration(seconds: 10), (timer) {
      messageController.getListMessage(userController.user.username!);
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text('${userController.user.fullname}'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 100),
            child: SingleChildScrollView(
              child: Obx(
                () {
                  if (messageController.listMessage.value.isNotEmpty) {
                    return Column(
                      children:
                          messageController.listMessage.value.map((message) {
                        bool isMainUserSend;
                        if (message.userSend?.username ==
                            userController.user.username) {
                          isMainUserSend = true;
                        } else {
                          isMainUserSend = false;
                        }
                        ////check lai user
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: isMainUserSend
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                isMainUserSend ? 'Me' : 'Admin',
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: isMainUserSend
                                        ? const Radius.circular(20)
                                        : const Radius.circular(5),
                                    bottomRight: isMainUserSend
                                        ? const Radius.circular(5)
                                        : const Radius.circular(20),
                                    topLeft: const Radius.circular(20),
                                    topRight: const Radius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  "${message.message}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  }
                  return const SizedBox.expand();
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width - 100,
                    child: RoundTextfield(
                      hintText: "Nhap tin nhan",
                      controller: _textEditingController,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () async {
                      if (_textEditingController.text.isNotEmpty) {
                        await messageController
                            .createChatMessageWithAdmin(
                              userController.user.username!,
                              _textEditingController.text,
                            )
                            .whenComplete(() =>
                                messageController.getListMessage(
                                    "${userController.user.username}"));
                        _textEditingController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}

class RoundTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? bgColor;
  final Widget? left;
  final Icon? icon;
  const RoundTextfield(
      {super.key,
      required this.hintText,
      required this.controller,
      this.bgColor,
      this.left,
      this.icon});

  // void checkOnchangedValidate(String? value) {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor ?? const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          icon != null
              ? Padding(padding: const EdgeInsets.only(left: 10), child: icon)
              : const SizedBox.shrink(),
          if (left != null)
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: left!,
            ),
          Expanded(
            child: TextFormField(
              controller: controller,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: Color(0xffB6B7B7),
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
