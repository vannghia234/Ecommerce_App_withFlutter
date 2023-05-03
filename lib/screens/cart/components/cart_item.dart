// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/configs/constant.dart';
import 'package:ecommerce_app/screens/cart/components/product.dart';

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
                  total += widget.cardProduct.products.price *
                      widget.cardProduct.quantity;
                } else {
                  chooseProduct.remove(widget.cardProduct);
                  total -= widget.cardProduct.products.price *
                      widget.cardProduct.quantity;
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
                    "assets/images/${widget.cardProduct.products.img}.png"),
              ),
            )),
        SizedBox(
          width: 20 * (MediaQuery.of(context).size.width) / 375,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cardProduct.products.name,
              style: const TextStyle(fontSize: 16, color: kPrimaryColor),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(TextSpan(
              text: "\$${widget.cardProduct.products.price}",
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: kPrimaryColor),
            ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.delete,
                color: kPrimaryColor,
              ),
              Row(
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
                          setState(() {
                            widget.cardProduct.quantity--;
                          });
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
                          setState(() {
                            widget.cardProduct.quantity++;
                          });
                        },
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget cartItem() {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return Container(
              height: 110,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Checkbox(
                      activeColor: kPrimaryColor,
                      value: cartProducts[i].isSelected,
                      onChanged: (value) {
                        setState(() {
                          cartProducts[i].isSelected = value!;
                          if (cartProducts[i].isSelected == true) {
                            chooseProduct.add(cartProducts[i]);
                            total += cartProducts[i].products.price *
                                cartProducts[i].quantity;
                          } else {
                            chooseProduct.remove(cartProducts[i]);
                            total -= cartProducts[i].products.price *
                                cartProducts[i].quantity;
                          }
                        });
                      }),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 224, 244),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                        "assets/images/${products[i].img}.png"), //// listproduct[i].pruductimage
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          products[i].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          products[i].price.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.delete,
                          color: kPrimaryColor,
                        ),
                        Row(
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
                                    setState(() {
                                      cartProducts[i].quantity--;
                                    });
                                  },
                                )),
                            const SizedBox(width: 8),
                            Text(
                              cartProducts[i].quantity.toString(),
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
                                    setState(() {
                                      cartProducts[i].quantity++;
                                    });
                                  },
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ));
        },
        itemCount: products.length,
      ),
    );
  }
}

// SizedBox(
          //   child: Column(
          //     children: [
          //       Container(
          //         height: 116.44,
          //         width: MediaQuery.of(context).size.width,
          //         decoration: const BoxDecoration(
          //           color: Colors.white,
          //         ),
          //         child: Container(
          //           margin: const EdgeInsets.symmetric(horizontal: 24.0),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   const Text(
          //                     "Total Payment",
          //                   ),
          //                   StreamBuilder<double>(
          //                     // stream: () {},
          //                     builder: (context, snapshot) {
          //                       if (snapshot.hasData) {
          //                         return const Text('total');
          //                       } else {
          //                         return Center(
          //                           child: Text(
          //                             total.toString(),
          //                           ),
          //                         );
          //                       }
          //                     },
          //                   ),
          //                 ],
          //               ),
          //               const SizedBox(
          //                 width: 23.0,
          //               ),
          //               SizedBox(
          //                 width: 185.29,
          //                 height: 50,
          //                 child: ElevatedButton(
          //                   style: ElevatedButton.styleFrom(
          //                     backgroundColor: kPrimaryColor,
          //                     shape: RoundedRectangleBorder(
          //                       borderRadius:
          //                           BorderRadius.circular(62), // <-- Radius
          //                     ),
          //                   ),
          //                   onPressed: () {
          //                     // Api checkout
          //                   },
          //                   child: const Text(
          //                     "Thanh toán",
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
