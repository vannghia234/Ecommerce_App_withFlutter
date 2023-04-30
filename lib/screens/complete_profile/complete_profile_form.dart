import 'package:ecommerce_app/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../configs/constant.dart';
import '../../widget/default_button.dart';
import '../../widget/form_err.dart';
import '../sign_in/components/customSuffixIcon.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

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
        buildAddressform(),
        FormError(errors: errors),
        const SizedBox(
          height: 40,
        ),
        DefaultButton(
          text: 'Continue',
          press: () {
            if (_formKey.currentState!.validate() == true) {
              Navigator.pushNamed(context, OtpScreen.routeName);
            }
          },
        )
      ]),
    );
  }

  TextFormField buildAddressform() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty == true && errors.contains(kAddressNullError)) {
          setState(() {
            errors.remove(kAddressNullError);
          });
        }
      },
      validator: (value) {
        if (value?.isEmpty == true && !errors.contains(kAddressNullError)) {
          setState(() {
            errors.add(kAddressNullError);
          });
          return "";
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
            svgIcon: 'assets/icons/Mail.svg',
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
