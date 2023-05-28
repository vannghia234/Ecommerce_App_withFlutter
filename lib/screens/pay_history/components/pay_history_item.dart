// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../configs/constant.dart';
import '../../../models/order_detail_response.dart';

class PayHistoryItem extends StatefulWidget {
  const PayHistoryItem({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final OrderDetails detail;
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
                  child: CachedNetworkImage(
                    imageUrl: widget.detail.product!.urlImageThumb!,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator.adaptive(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )),
            )),
        SizedBox(
          width: 20 * (MediaQuery.of(context).size.width) / 375,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.detail.product!.productName!,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: kPrimaryColor,
                ),
                maxLines: 2,
              ),
              Text(
                NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
                    .format(widget.detail.product!.price!),
                style: const TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.black),
              ),
              Text.rich(TextSpan(
                text: "Số lượng: ${widget.detail.quantity}",
                style: const TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.black),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
