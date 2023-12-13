import '../user_model.dart';

class ChatResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  List<ChatModel>? data;

  ChatResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  ChatResponse.fromJson(Map<String, dynamic> json) {
    final listJson = json['data'] as List<dynamic>;
    id = json['id'];
    timestamp = json['timestamp'];
    apiVersion = json['apiVersion'];
    status = json['status'];
    message = json['message'];
    // ignore: unused_label
    data:
    // listJson.map((chat) => ChatModel.fromJson(chat)).toList();
    if (json['data'] != null) {
      data = <ChatModel>[];
      json['data'].forEach((v) {
        data!.add(ChatModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['timestamp'] = timestamp;
    data['apiVersion'] = apiVersion;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? message;
  String? time;
  UserReceive? userReceive;
  UserReceive? userSend;

  Data({this.id, this.message, this.time, this.userReceive, this.userSend});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    time = json['time'];
    userReceive = json['userReceive'] != null
        ? UserReceive.fromJson(json['userReceive'])
        : null;
    userSend = json['userSend'] != null
        ? UserReceive.fromJson(json['userSend'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['time'] = time;
    if (userReceive != null) {
      data['userReceive'] = userReceive!.toJson();
    }
    if (userSend != null) {
      data['userSend'] = userSend!.toJson();
    }
    return data;
  }
}

class UserReceive {
  String? id;
  String? fullname;
  String? email;
  String? username;
  String? password;
  String? phone;
  String? avatarUrl;

  UserReceive(
      {this.id,
      this.fullname,
      this.email,
      this.username,
      this.password,
      this.phone,
      this.avatarUrl});

  UserReceive.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    phone = json['phone'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['phone'] = phone;
    data['avatarUrl'] = avatarUrl;
    return data;
  }
}
