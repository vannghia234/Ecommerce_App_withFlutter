import 'package:ecommerce_app/constant.dart';
import 'package:ecommerce_app/screen/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screen/splash/component/splash_content.dart';
import 'package:flutter/material.dart';

import '../../../widget/default_button.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, let's shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people connect with store \narround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop . \njust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => SplashContent(
                        text: splashData[index]["text"]!,
                        image: splashData[index]["image"]!,
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                  splashData.length, (index) => buildDot(index))
                            ],
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          DefaultButton(
                            text: 'Continue',
                            press: () {
                              Navigator.pushNamed(
                                  context, SignInScreen.routeName);
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ))
              ],
            )));
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0XFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
