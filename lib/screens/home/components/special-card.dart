import 'package:flutter/material.dart';

import 'offer-card.dart';

class SpecialCard extends StatelessWidget {
  const SpecialCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          OfferCard(
            category: 'Hàng tiêu dùng & Thực phẩm',
            image: 'assets/images/bannerSale1.jpg',
            numOfBrand: 9,
            press: () {},
          ),
          const SizedBox(
            width: 20,
          ),
          OfferCard(
            category: 'Vitamin & Thực phẩm chức năng',
            image: 'assets/images/bannerSale2.jpg',
            numOfBrand: 5,
            press: () {},
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
