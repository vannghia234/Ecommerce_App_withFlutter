import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widget/default_button.dart';
import '../sign_in/components/customSuffixIcon.dart';

class NewPassScreen extends StatelessWidget {
  const NewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Otp Code'),
        ),
        body: Container(
            padding: const EdgeInsets.all(0.2),
            child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.black),
                      ),
                      const Text(
                        'Please enter your Otp code',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      TextFormField(
                        //onSaved: (newValue) => phone = newValue,
                        onChanged: (value) {
                          
                        },
                        validator: (value) {
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            hintText: 'Enter your phone',
                            labelText: 'Phone Number',
                            suffixIcon: CustomSuffix(
                              svgIcon: 'assets/icons/Mail.svg',
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      DefaultButton(
                        text: 'Request Change Password',
                        press: () async {
                          // if(firebaseController.verifyOtp(otp) == true){
                            
                          // }
                        },
                      ),
                    ]),
                  ),
                ))));
  }
}
