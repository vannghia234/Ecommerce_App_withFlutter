class UserAddressResponse {
  String? id;
  String? timestamp;
  String? apiVersion;
  String? status;
  String? message;
  List<Address>? data;

  UserAddressResponse(
      {this.id,
      this.timestamp,
      this.apiVersion,
      this.status,
      this.message,
      this.data});

  UserAddressResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timestamp = json['timestamp'];
    apiVersion = json['apiVersion'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Address>[];
      json['data'].forEach((v) {
        data!.add(Address.fromJson(v));
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

class Address {
  String? id;
  String? address;
  String? phone;
  String? nameUserShipping;
  String? location;
  bool? isDefault;

  Address(
      {this.id,
      this.address,
      this.phone,
      this.nameUserShipping,
      this.location,
      this.isDefault});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    phone = json['phone'];
    nameUserShipping = json['nameUserShipping'];
    location = json['location'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['phone'] = phone;
    data['nameUserShipping'] = nameUserShipping;
    data['location'] = location;
    data['isDefault'] = isDefault;
    return data;
  }
}
