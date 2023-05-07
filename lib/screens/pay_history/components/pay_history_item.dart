// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/screens/pay_history/components/pay_history.dart';
import 'package:flutter/material.dart';

import '../../../configs/constant.dart';

class PayHistoryItem extends StatefulWidget {
  const PayHistoryItem({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final OrderDetail detail;
  @override
  State<PayHistoryItem> createState() => _PayHistoryItemState();
}

class _PayHistoryItemState extends State<PayHistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
                    "assets/images/${widget.detail.products.img}.jpg"),
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
                  text: widget.detail.products.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    color: kPrimaryColor,
                  )),
              maxLines: 2,
            ),
            Text.rich(TextSpan(
              text: "đ${widget.detail.products.price}",
              style: const TextStyle(
                  fontWeight: FontWeight.w300, color: Colors.black),
            )),
            Text.rich(TextSpan(
              text: "Số lượng: ${widget.detail.quantity}",
              style: const TextStyle(
                  fontWeight: FontWeight.w300, color: Colors.black),
            ))
          ],
        ),
      ],
    );
  }
}
