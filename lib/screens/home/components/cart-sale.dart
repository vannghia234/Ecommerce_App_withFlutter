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
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight * 0.13,
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.6),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 3, offset: Offset(2, 6))
            ],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: const Padding(
          padding: EdgeInsets.only(left: 25, top: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'A Summer Surprise',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              'Flash sale 20%',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Page 2"),
    );
  }
}
