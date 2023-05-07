import 'package:ecommerce_app/screens/user_profile/user_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../configs/constant.dart';
import '../../../configs/size_config.dart';

class CardSale extends StatelessWidget {
  const CardSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserProfileScreen(),
            ));
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight * 0.13,
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.6),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5,
                  blurRadius: 12,
                  offset: Offset(5, 2))
            ],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'A Summer Surprise',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  'Flash sale 20%',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ),
    );
  }
}
