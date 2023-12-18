import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({required String content}) {
  Get.snackbar('Thông báo', content,
      icon: const Icon(Icons.notification_important),
      shouldIconPulse: true,
      isDismissible: true,
      titleText: const Text(
        'Thông báo',
        style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
      ));
}

const kPrimaryColor = Color(0xff23395d);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kExistAccount = 'Tài khoản này không tồn tại';
const String kInvalidUsernamePassword =
    'Tài khoản hoặc mật khẩu không chính xác';
const String kInvalidEmail = "Định dạng email không hợp lệ";
const String kUserNullError = "Vui lòng nhập username";
const String kEmailError = "Vui lòng nhập email";
const String kPassNullError = "Vui lòng nhập mật khẩu";
const String kShortPassError = "Mật khẩu quá ngắn";
const String kMatchPassError = "Mật khẩu không khớp nhau";
const String kNamelNullError = "Vui lòng nhập tên";
const String kPhoneNumberNullError = "Vui lòng nhập số điện thoại";
const String kAddressNullError = "Vui lòng nhập địa chỉ";

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: kTextColor),
  );
}

double convertCurrencyVNDtoUSD(double amountInVND) {
  // Tỷ giá cố định: 1 USD = 23000 VND
  double exchangeRate = 23000;

  // Thực hiện chuyển đổi
  double convertedAmount = amountInVND / exchangeRate;

  return convertedAmount;
}
