// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/get_cart_user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/configs/constant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/update-total-controller.dart';
import '../../../models/cart_product_response.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.cardProduct,
  }) : super(key: key);

  final ProductCart cardProduct;

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
                widget.cardProduct.isSelected = value;
                if (widget.cardProduct.isSelected == true) {
                  chooseProduct.add(widget.cardProduct);
                  controller.chooseProduct(widget.cardProduct.product!.price!,
                      widget.cardProduct.quantity!);
                } else {
                  chooseProduct.remove(widget.cardProduct);
                  controller.unchosenProduct(widget.cardProduct.product!.price!,
                      widget.cardProduct.quantity!);
                }
              });
            }),
        Expanded(
          flex: 2,
          child: SizedBox(
              width: 88 * (MediaQuery.of(context).size.width) / 375,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.cardProduct.product!.urlImageThumb!,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator.adaptive(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )),
              )),
        ),
        SizedBox(
          width: 20 * (MediaQuery.of(context).size.width) / 375,
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cardProduct.product!.productName!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                      .format(widget.cardProduct.product!.price!),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: kPrimaryColor),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 10, 10),
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
                            if (widget.cardProduct.isSelected!) {
                              controller.decreaseTotal(
                                  widget.cardProduct.product!.price!);
                            }
                            widget.cardProduct.quantity =
                                widget.cardProduct.quantity! - 1;
                          },
                        )),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        widget.cardProduct.quantity.toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    //const SizedBox(width: 8),
                    Container(
                        padding: const EdgeInsets.all(1),
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
                            if (widget.cardProduct.isSelected!) {
                              controller.incrementTotal(
                                  widget.cardProduct.product!.price!);
                            }
                            widget.cardProduct.quantity =
                                widget.cardProduct.quantity! + 1;
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
