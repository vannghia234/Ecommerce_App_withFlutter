import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/cart/components/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                child: Dismissible(
                  key: Key(cartProducts[index].products.name.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset("assets/icons/remove.svg"),
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      cartProducts.remove(cartProducts[index]);
                      // cartProducts.length--;
                    });
                  },
                  child: CartItem(cardProduct: cartProducts[index]),
                ))));
  }
}
///ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     String item = items[index];
    //     return Card(
    //       child: CheckboxListTile(
    //         title: Text(item),
    //         subtitle: Text('\$10'),
    //         value: true,
    //         onChanged: (bool? value) {
    //           // setState(() {
    //           //   selectedItems[index] = value!;
    //           // });
    //         },
    //         secondary: Image.asset(
    //           "assets/images/shoes2.png",
    //           width: 80,
    //           height: 80,
    //         ),
    //       ),
    //     );
    //   },
    // );
