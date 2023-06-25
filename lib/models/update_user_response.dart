import '../user_model.dart';

class UpdateUserResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  UserModel? data;

  UpdateUserResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    timestamp = json["timestamp"];
    apiVersion = json["apiVersion"];
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : UserModel.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = <String, dynamic>{};
    data1["id"] = id;
    data1["timestamp"] = timestamp;
    data1["apiVersion"] = apiVersion;
    data1["status"] = status;
    data1["message"] = message;
    if (data != null) {
      data1["data"] = data?.toJson();
    }
    return data1;
  }
}

class UpdateUser {
  String? username;
  String? fullname;
  String? email;
  String? phone;

  UpdateUser({this.username, this.fullname, this.email, this.phone});

  UpdateUser.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    fullname = json["fullname"];
    email = json["email"];
    phone = json["phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["fullname"] = fullname;
    data["email"] = email;
    data["phone"] = phone;
    return data;
  }
}
