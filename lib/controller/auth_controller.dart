import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class AuthController extends GetxController {
  RxString username = ''.obs;
  RxString password = ''.obs;
  RxBool isRemember = false.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getSavedCredentials();
  }

  Future<void> getSavedCredentials() async {
    if (box.hasData('username') &&
        box.hasData('password') &&
        box.hasData('isRemember')) {
      username.value = box.read('username');
      password.value = box.read('password');
      isRemember.value = box.read('isRemember');
    }
  }

  Future<void> saveCredentials(
      String username, String password, bool rememberMe) async {
    await box.write('username', username);
    await box.write('password', password);
    await box.write('isRemember', rememberMe);
    this.username.value = username;
    this.password.value = password;
    isRemember.value = rememberMe;
  }
}

class FirebaseAuthController extends GetxController {
  static FirebaseAuthController get instance => Get.find();

  //Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
  var countrycode = '+84';

  Future<void> phoneSendOtp(String phoneNo) async {
    Logger().i(phoneNo);
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provider phone number is not valid');
          } else {
            Get.snackbar('Error', '$e');
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
          Get.snackbar('Otp Code', verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOtp(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }
}

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await FirebaseAuthController.instance.verifyOtp(otp);
    isVerified ? Get.offAll(const SignInScreen()) : Get.back();
  }
}
