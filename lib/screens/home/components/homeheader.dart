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
        IconButton(
            onPressed: () {
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
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ));
              },
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
