import 'dart:convert';

import 'package:ecommerce_app/api/chat/fetch_api_chat.dart';
import 'package:ecommerce_app/screens/chat/chat-screen.dart';
import 'package:ecommerce_app/user_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ChatMessageController extends GetxController {
  RxList<ChatModel> listMessage = <ChatModel>[].obs;

  Future getListMessage(String username) async {
    try {
      Logger().i(username);
      final res = await FetchApiChatService.instance.getMessage(username);

      listMessage.value = res?.data ?? List.empty();
      // Logger().i(listMessage.value.length);
    } catch (e) {
      print(e);
    }
  }

  Future createChatMessageWithAdmin(String userSend, String message) async {
    try {
      Logger().i(userSend);
      final res = await FetchApiChatService.instance
          .sendMessage(userSend, 'nghiatrong', message);
      Logger().i('log res create chat $res');
      getListMessage(userSend);
    } catch (e) {
      print(e);
    }
  }
}
