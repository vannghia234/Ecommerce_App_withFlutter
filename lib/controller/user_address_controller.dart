import 'dart:convert';

import 'package:ecommerce_app/api/api_url.dart';
import 'package:ecommerce_app/api/constant.dart';
import 'package:ecommerce_app/models/useraddress-response.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'login_account_info_controller.dart';

class UserAdressInfoController extends GetxController {
  var listAddress = <Address>[].obs;
  late Rx<Address>? addressDefault;
  final box = GetStorage();

  @override
  void onInit() {
    final controllerUserInfo = Get.find<LoginAccountInfoController>();
    getAddressUser(controllerUserInfo.user.id!);
    addressDefault = Rx<Address>(Address());
    // getAddressUser();
    if (listAddress.isNotEmpty) {
      addressDefault?.value = listAddress[0];
    }
    // TODO: implement onInit
    super.onInit();
  }

  Future<UserAddressResponse?> getAddressUser(String userId) async {
    var url = Uri.parse(ApiUrl.apiGetAddress + userId);
    try {
      final res = await http.get(url, headers: header);
      var data = UserAddressResponse.fromJson(jsonDecode(res.body));
      Logger().i('GET ALL ADDRESS: ${res.statusCode} ');
      Logger().i('MESS GET ALL ADDRESS: ${data.message} ');

      listAddress.assignAll(data.data as List<Address>);
      Logger().i('LIST ADDRESS: ${listAddress.length} ');
      for (var element in listAddress.value) {
        if (element.isDefault == true) {
          addressDefault?.value = element;
          addressDefault?.refresh();
          Logger().i('test Address Default ${addressDefault?.value.address}');
          return data;
        }
      }
      if (listAddress.isNotEmpty) {
        addressDefault?.value = listAddress[0];
        addressDefault?.refresh();
      }
      return data;
    } catch (e) {
      Logger().i('EXCEPTION CATCH: $e ');
    }
    return null;
  }

  Future<void> updateStatusAddress(String userId, String addressId) async {
    var url = Uri.parse('${ApiUrl.apiPutAddress}$userId/$addressId');
    Logger().i('URL: ${ApiUrl.apiPutAddress}$userId/$addressId');

    try {
      final res = await http.put(url, headers: header);
      Logger().i('STATUS UPDATE ADDRESS: ${res.statusCode} ');
    } catch (e) {
      Logger().i('EXCEPTION CATCH: $e ');
    }
  }

  Future<bool> postAddressUser(
      {required String userId,
      required String userNameShipping,
      required String sdt,
      required String address,
      required String location}) async {
    var url = Uri.parse(ApiUrl.apiPostAddress);
    var body = <String, String>{
      "userID": userId,
      "userNameShipping": userNameShipping,
      "Sdt": sdt,
      "address": address,
      "location": location
    };
    try {
      final res = await http.post(url, headers: header, body: jsonEncode(body));
      // var data = UserAddressResponse.fromJson(jsonDecode(res.body));
      Logger().i('POST ADDRESS: ${res.statusCode} ');
      return true;
    } catch (e) {
      Logger().i('EXCEPTION CATCH: $e ');
    }
    return false;
  }
  // void updateStatusIndex(int index) {
  //   if (listAddress.isNotEmpty) {
  //     for (int i = 0; i < listAddress.length; i++) {
  //       if (listAddress[i] == listAddress[index]) {
  //         listAddress[i].isDefault = true;
  //         addressDefault?.value = listAddress[i];
  //       } else {
  //         listAddress[i].isDefault = false;
  //       }
  //     }
  //     addressDefault?.refresh();
  //   }
  // }

  // void updateStatus() {
  //   if (listAddress.isNotEmpty) {
  //     for (var element in listAddress) {
  //       if (element.isDefault == true) {
  //         addressDefault?.value = element;
  //       } else {
  //         element.isDefault = false;
  //       }
  //     }
  //     addressDefault?.value = listAddress[0];
  //     addressDefault?.refresh();
  //   } else {
  //     return;
  //   }
  // }

  // void addAddressForUser(Address address) {
  //   listAddress.add(address);

  //   addressDefault?.refresh();
  //   updateStatus();
  //   saveAddress();
  // }

  // Future<void> saveAddress() async {
  //   await box.write('listaddress', listAddress);
  // }

  // Future<void> getAddressUser() async {
  //   if (box.hasData('listaddress')) {
  //     final listDynamic = box.read('productFavourite') as List<dynamic>;
  //     listAddress.assignAll(listDynamic.map((dynamic item) {
  //       var addr = Address.fromJson(item);
  //       return addr;
  //     }).toList());
  //   }
  // }

  // void reloadAddress() {
  //   Logger().i('reload address');
  //   for (var element in listAddress.value) {
  //     if (element.isDefault == true) {
  //       Logger().i('test Address Default ${element.address}');
  //       addressDefault?.value = element;
  //       addressDefault?.refresh();
  //       return;
  //     }
  //   }
  //   // addressDefault?.value = listAddress[0];
  //   // Logger().i('reload address DONE${listAddress[0]s.address!}');

  //   return;
  // }
}
