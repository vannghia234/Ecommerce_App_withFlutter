import 'package:flutter/material.dart';

import '../../../configs/constant.dart';
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
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            onChanged: (value) {},
            decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                hintText: 'Search product',
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        IconBtnWithCounter(
          press: () {},
          svgSrc: 'assets/icons/Cart Icon.svg',
        ),
        IconBtnWithCounter(
          press: () {},
          svgSrc: 'assets/icons/Bell.svg',
          numOfItems: 5,
        ),
      ],
    );
  }
}
