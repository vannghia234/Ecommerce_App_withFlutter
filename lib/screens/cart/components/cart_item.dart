// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/cart/components/product.dart';
import 'package:get/get.dart';

import '../../../controller/update-total-controller.dart';
import '../cart_screen.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.cardProduct,
  }) : super(key: key);

  final CartProduct cardProduct;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //// Input List Product
  //int total = Body().total;
  final TotalController controller = Get.put(TotalController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: kPrimaryColor,
            value: widget.cardProduct.isSelected,
            onChanged: (value) {
              setState(() {
                widget.cardProduct.isSelected = value!;
                if (widget.cardProduct.isSelected == true) {
                  chooseProduct.add(widget.cardProduct);
                  controller.chooseProduct(widget.cardProduct.products.price,
                      widget.cardProduct.quantity);
                } else {
                  chooseProduct.remove(widget.cardProduct);
                  controller.unchosenProduct(widget.cardProduct.products.price,
                      widget.cardProduct.quantity);
                }
              });
            }),
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
                    "assets/images/${widget.cardProduct.products.img}.jpg"),
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
                  text: widget.cardProduct.products.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: kPrimaryColor,
                  )),
              maxLines: 2,
            ),
            Text.rich(TextSpan(
              text: "đ${widget.cardProduct.products.price}",
              style: const TextStyle(
                  fontWeight: FontWeight.w300, color: Colors.black),
            ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 50, 0, 10),
                child: Row(
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          child: const Icon(
                            CupertinoIcons.minus,
                            size: 18,
                            color: kPrimaryColor,
                          ),
                          onTap: () {
                            setState(() {});
                            if (widget.cardProduct.isSelected) {
                              controller.decreaseTotal(
                                  widget.cardProduct.products.price);
                            }
                            widget.cardProduct.quantity--;
                          },
                        )),
                    const SizedBox(width: 8),
                    Text(
                      widget.cardProduct.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F8FA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          child: const Icon(
                            CupertinoIcons.plus,
                            size: 18,
                            color: kPrimaryColor,
                          ),
                          onTap: () {
                            setState(() {});
                            if (widget.cardProduct.isSelected) {
                              controller.incrementTotal(
                                  widget.cardProduct.products.price);
                            }
                            widget.cardProduct.quantity++;
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
