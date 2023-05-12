import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/widget/search-view-btn.dart';
import 'package:flutter/material.dart';

import 'icon_btn.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Container(
        //   width: MediaQuery.of(context).size.width * 0.6,
        //   decoration: BoxDecoration(
        //       color: kSecondaryColor.withOpacity(0.1),
        //       borderRadius: BorderRadius.circular(15)),
        //   child: TextField(
        //     onChanged: (value) {},
        //     decoration: const InputDecoration(
        //         enabledBorder: InputBorder.none,
        //         focusedBorder: InputBorder.none,
        //         contentPadding:
        //             EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        //         hintText: 'Search product',
        //         prefixIcon: Icon(Icons.search)),
        //   ),
        // ),
        IconButton(
            onPressed: () {
              // Navigator.pushNamed(
              //   context,
              //   SearchViewButton.routeName,
              // );
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const SearchViewButton(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ));
            },
            icon: const Icon(
              Icons.search,
              color: kSecondaryColor,
              size: 26,
            )),
        Row(
          children: [
            IconBtnWithCounter(
              press: () {},
              svgSrc: 'assets/icons/Cart Icon.svg',
            ),
            const SizedBox(
              width: 10,
            ),
            IconBtnWithCounter(
              press: () {},
              svgSrc: 'assets/icons/Bell.svg',
              numOfItems: 5,
            ),
          ],
        ),
      ],
    );
  }
}
