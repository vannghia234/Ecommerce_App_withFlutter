class LoginResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  Data? data;

  LoginResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
    if (json["apiVersion"] is String) {
      apiVersion = json["apiVersion"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
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

class Data {
  UserStored? userStored;
  String? accessToken;
  String? refreshToken;

  Data({this.userStored, this.accessToken, this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["userStored"] is Map) {
      userStored = json["userStored"] == null
          ? null
          : UserStored.fromJson(json["userStored"]);
    }
    if (json["accessToken"] is String) {
      accessToken = json["accessToken"];
    }
    if (json["refreshToken"] is String) {
      refreshToken = json["refreshToken"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userStored != null) {
      data["userStored"] = userStored?.toJson();
    }
    data["accessToken"] = accessToken;
    data["refreshToken"] = refreshToken;
    return data;
  }
}

class UserStored {
  String? id;
  String? fullname;
  String? email;
  String? username;
  String? password;
  String? phone;
  dynamic avatarUrl;
  Permission? permission;

  UserStored(
      {this.id,
      this.fullname,
      this.email,
      this.username,
      this.password,
      this.phone,
      this.avatarUrl,
      this.permission});

  UserStored.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["fullname"] is String) {
      fullname = json["fullname"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["username"] is String) {
      username = json["username"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    avatarUrl = json["avatarUrl"];
    if (json["permission"] is Map) {
      permission = json["permission"] == null
          ? null
          : Permission.fromJson(json["permission"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["fullname"] = fullname;
    data["email"] = email;
    data["username"] = username;
    data["password"] = password;
    data["phone"] = phone;
    data["avatarUrl"] = avatarUrl;
    if (permission != null) {
      data["permission"] = permission?.toJson();
    }
    return data;
  }
}

class Permission {
  String? id;
  String? name;
  bool? isAvailable;

  Permission({this.id, this.name, this.isAvailable});

  Permission.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["isAvailable"] is bool) {
      isAvailable = json["isAvailable"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["isAvailable"] = isAvailable;
    return data;
  }
}
