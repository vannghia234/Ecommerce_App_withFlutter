import 'package:ecommerce_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_account_info_controller.dart';

class ChatPage extends StatefulWidget {
  final List<ChatModel> listChat;
  ChatPage({super.key, required this.listChat});
  final userController = Get.find<LoginAccountInfoController>();

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Rx<List<ChatModel>> messages = Rx<List<ChatModel>>([]).obs();

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    messages.value = widget.listChat;
  }

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<LoginAccountInfoController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Obx(() {
            if (messages.value.isNotEmpty) {
              return Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: messages.value.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = messages.value[index];
                    if (messages.value[index].userSend!.id ==
                        userController.user.id) {
                      return ListTile(
                        title: Text(
                          "${message.message}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        // subtitle: Text(
                        //   message.userSend == userController. ? 'Me' : 'Other',
                        //   style: const TextStyle(
                        //     fontStyle: FontStyle.italic,
                        //   ),
                        // ),
                        // trailing: message.userSend == user
                        //     ? const Icon(Icons.check, color: Colors.blue)
                        //     : null,
                      );
                    }
                    return null;
                  },
                ),
              );
            }
            return const Text("No chat");
          }),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // if (_textEditingController.text.isNotEmpty) {
                    //   _sendMessage(_textEditingController.text);
                    // }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}
