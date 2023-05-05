import 'package:ecommerce_app/screens/cart/components/product.dart';
import 'package:ecommerce_app/screens/pay_cart/components/paycart_item.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20 * (MediaQuery.of(context).size.width) / 375),
      child: ListView.builder(
          itemCount: chooseProduct.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: PayCartItem(cartProduct: chooseProduct[index]),
              )),
    );
  }
}
