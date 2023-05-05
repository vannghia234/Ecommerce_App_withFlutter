import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/cart/components/product.dart';
import 'package:flutter/material.dart';

import 'cart_item.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20 * (MediaQuery.of(context).size.width) / 375),
        child: ListView.builder(
            itemCount: cartProducts.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    const Divider(
                      thickness: 5,
                    ),
                    const SizedBox(height: 15),
                    Dismissible(
                      key: Key(cartProducts[index].products.name.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: kPrimaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: const [
                            Spacer(),
                            Icon(
                              Icons.delete_outline,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          chooseProduct.remove(cartProducts[index]);
                          cartProducts.remove(cartProducts[index]);
                        });
                      },
                      child: CartItem(cardProduct: cartProducts[index]),
                    ),
                  ],
                ))));
  }
}
