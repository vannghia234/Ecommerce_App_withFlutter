class ChangePassResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  UserNotPass? data;

  ChangePassResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  ChangePassResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    timestamp = json["timestamp"];
    apiVersion = json["apiVersion"];
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : UserNotPass.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = <String, dynamic>{};
    data1["id"] = id;
    data1["timestamp"] = timestamp;
    data1["apiVersion"] = apiVersion;
    data1["status"] = status;
    data1["message"] = message;
    data1["data"] = data?.toJson();
    return data1;
  }
}

class UserNotPass {
  String? id;
  String? fullname;
  String? email;
  String? username;
  String? phone;
  dynamic avatarUrl;

  UserNotPass(
      {this.id,
      this.fullname,
      this.email,
      this.username,
      this.phone,
      this.avatarUrl});

  UserNotPass.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullname = json["fullname"];
    email = json["email"];
    username = json["username"];
    phone = json["phone"];
    avatarUrl = json["avatarUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["fullname"] = fullname;
    data["email"] = email;
    data["username"] = username;
    data["phone"] = phone;
    data["avatarUrl"] = avatarUrl;
    return data;
  }
}
