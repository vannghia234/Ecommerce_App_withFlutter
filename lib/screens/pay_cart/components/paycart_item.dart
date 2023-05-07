// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_app/screens/cart/components/product.dart';

import '../../../configs/constant.dart';

class PayCartItem extends StatefulWidget {
  const PayCartItem({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  final CartProduct cartProduct;
  @override
  State<PayCartItem> createState() => _PayCartItemState();
}

class _PayCartItemState extends State<PayCartItem> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
          width: 88 * (MediaQuery.of(context).size.width) / 375,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                  "assets/images/${widget.cartProduct.products.img}.jpg"),
            ),
          )),
      SizedBox(
        width: 20 * (MediaQuery.of(context).size.width) / 375,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
                text: widget.cartProduct.products.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                )),
            maxLines: 2,
          ),
          const SizedBox(height: 10),
          Text.rich(TextSpan(
            text: "\$${widget.cartProduct.products.price}",
            style: const TextStyle(
                fontWeight: FontWeight.w300, color: Colors.black),
          )),
          const SizedBox(height: 10),
          Text.rich(TextSpan(
            text: "Qty: ${widget.cartProduct.quantity}",
            style: const TextStyle(
                fontWeight: FontWeight.w300, color: Colors.black),
          ))
        ],
      )
    ]);
  }
}
