import 'package:ecommerce_app/api/auth/register_account.dart';
import 'package:ecommerce_app/root.dart';
import 'package:ecommerce_app/widget/show_loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../configs/constant.dart';
import '../../widget/default_button.dart';
import '../../widget/form_err.dart';
import '../sign_in/components/customSuffixIcon.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key, required this.agrs});
  final Map<String, dynamic> agrs;

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;

  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        buildFirstNameForm(),
        const SizedBox(
          height: 30,
        ),
        buildLastNameForm(),
        const SizedBox(
          height: 30,
        ),
        buildPhoneNumberForm(),
        const SizedBox(
          height: 30,
        ),
        buildEmailform(),
        FormError(errors: errors),
        const SizedBox(
          height: 40,
        ),
        DefaultButton(
          text: 'Tiếp tục',
          press: () async {
            if (_formKey.currentState!.validate() == true) {
              _formKey.currentState?.save();
              String fullname = '$firstName $lastName';
              String username = widget.agrs['username'];
              String password = widget.agrs['password'];

              showLoadingAnimation(context);

              final response = await ApiRegister.register(
                  fullname: fullname,
                  email: email!,
                  username: username,
                  password: password,
                  phone: phoneNumber!);
              Get.back();
              if (response.message == 'User already exist') {
                // thong bao
                Get.snackbar('Thông báo', "Tài khoản này đã tồn tại",
                    icon: const Icon(Icons.notification_important),
                    shouldIconPulse: true,
                    isDismissible: true,
                    titleText: const Text(
                      'Thông báo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kPrimaryColor),
                    ));
                return;
              }

              if (response.status == 'Success') {
                //chuyen trang
                Get.snackbar('Thông báo', "Đăng ký tài khoản thành công",
                    isDismissible: true,
                    icon: const Icon(Icons.verified),
                    titleText: const Text(
                      'Thông báo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: kPrimaryColor),
                    ));
                Get.toNamed(RootApp.routeName);
              }
            }
          },
        )
      ]),
    );
  }

  TextFormField buildEmailform() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty == true && errors.contains(kEmailError)) {
          setState(() {
            errors.remove(kEmailError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmail)) {
          setState(() {
            errors.remove(kInvalidEmail);
          });
        }
      },
      validator: (value) {
        if (value?.isEmpty == true && !errors.contains(kEmailError)) {
          setState(() {
            errors.add(kEmailError);
          });
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value!) &&
            !errors.contains(kInvalidEmail)) {
          setState(() {
            errors.add(kInvalidEmail);
          });
          return '';
        }
        return null;
      },
      cursorColor: Colors.black,
      decoration: const InputDecoration(
          hintText: 'Enter your address',
          labelText: 'Address',
          suffixIcon: CustomSuffix(
            svgIcon: 'assets/icons/Location point.svg',
          )),
    );
  }

  TextFormField buildPhoneNumberForm() {
    return TextFormField(
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty == true &&
            errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.remove(kPhoneNumberNullError);
          });
        }
      },
      validator: (value) {
        if (value?.isEmpty == true && !errors.contains(kPhoneNumberNullError)) {
          setState(() {
            errors.add(kPhoneNumberNullError);
          });
          return "";
        }
        return null;
      },
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          hintText: 'Enter your phone number',
          labelText: 'Phone Number',
          suffixIcon: CustomSuffix(
            svgIcon: 'assets/icons/Phone.svg',
          )),
    );
  }

  TextFormField buildLastNameForm() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
          hintText: 'Enter your last name',
          labelText: 'Last Name',
          suffixIcon: CustomSuffix(
            svgIcon: 'assets/icons/User.svg',
          )),
    );
  }

  TextFormField buildFirstNameForm() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty == true && errors.contains(kNamelNullError)) {
          setState(() {
            errors.remove(kNamelNullError);
          });
        }
      },
      validator: (value) {
        if (value?.isEmpty == true && !errors.contains(kNamelNullError)) {
          setState(() {
            errors.add(kNamelNullError);
          });
          return "";
        }
        return null;
      },
      cursorColor: Colors.black,
      decoration: const InputDecoration(
          hintText: 'Enter your first name',
          labelText: 'First Name',
          suffixIcon: CustomSuffix(
            svgIcon: 'assets/icons/User.svg',
          )),
    );
  }
}
