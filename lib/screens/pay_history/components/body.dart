import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/pay_history/components/pay_history.dart';
import 'package:ecommerce_app/screens/pay_history/components/pay_history_item.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20 * (MediaQuery.of(context).size.width) / 375),
      child: ListView.builder(
          itemCount: check.length,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  const Divider(
                    thickness: 4,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text.rich(TextSpan(
                        text: check[index].status,
                        style: const TextStyle(
                          color: kPrimaryColor,
                        ))),
                  ),
                  InkWell(
                      onTap: () {},
                      child: PayHistoryItem(detail: checkDetail[index])),
                  const Divider(thickness: 2),
                  Row(
                    children: [
                      Text.rich(TextSpan(
                          text: 'Số lượng sản phẩm: ${check[index].quantity}')),
                      const Spacer(),
                      Text.rich(TextSpan(
                          text: 'Tổng tiền: ${check[index].totalPrice}'))
                    ],
                  )
                ],
              ))),
    );
  }
}
