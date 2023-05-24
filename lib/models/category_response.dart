class CategoryResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  List<Data>? data;

  CategoryResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
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
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data1 = <String, dynamic>{};
    data1["id"] = id;
    data1["timestamp"] = timestamp;
    data1["apiVersion"] = apiVersion;
    data1["status"] = status;
    data1["message"] = message;
    data1["data"] = data?.map((e) => e.toJson()).toList();
    return data1;
  }
}

class Data {
  String? categoryId;
  String? categoryName;

  Data({this.categoryId, this.categoryName});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["categoryId"] is String) {
      categoryId = json["categoryId"];
    }
    if (json["categoryName"] is String) {
      categoryName = json["categoryName"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["categoryId"] = categoryId;
    data["categoryName"] = categoryName;
    return data;
  }
}
