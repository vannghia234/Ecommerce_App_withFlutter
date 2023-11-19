import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/api/constant.dart';
import 'package:ecommerce_app/models/chat_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../models/chat_account_list_response.dart';

class FetchApiChatService {
  static final FetchApiChatService instance = FetchApiChatService._internal();

  factory FetchApiChatService() {
    return instance;
  }

  FetchApiChatService._internal();

  Future<AccountListChatResponse?> getListAccount() async {
    var url = Uri.parse(ApiUrl.apiGetListAccountChat);
    try {
      final response = await http.get(url, headers: header);

      var accountList =
          AccountListChatResponse.fromJson(jsonDecode(response.body));

      Logger().i('Get List Account');
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<ChatResponse?> getMessage(
      String userId, String page, String pageSize) async {
    var url = Uri.parse(ApiUrl.apiGetMessage);

    try {
      final response = await http.get(url);

      var messages = ChatResponse.fromJson(jsonDecode(response.body));
      return messages;
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<ChatResponse?> sendMessage(
      String userSend, String userreceive, String message) async {
    var url = Uri.parse(ApiUrl.apiSendMessage);

    final body = <String, String>{
      "userSend": userSend,
      "userReceive": userreceive,
      "message": message
    };

    try {
      var response = await http.post(url, body: jsonEncode(body));
      final result = ChatResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
