// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/screens/pay_history/components/row_review_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/models/order_detail_response.dart';
import 'package:intl/intl.dart';

import '../../../configs/constant.dart';
import '../../../controller/order_controller.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.args,
    required this.orderId,
  }) : super(key: key);
  final List<OrderDetails> args;
  final String orderId;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final List<OrderDetails> args;

  final orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {  
    print('rebuild lại body của trang chi tiết');
    print(widget.args[0].isReviewed);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20 * (MediaQuery.of(context).size.width) / 375),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.args.length,
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width:
                                88 * (MediaQuery.of(context).size.width) / 375,
                            child: AspectRatio(
                              aspectRatio: 0.88,
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: widget
                                        .args[index].product!.urlImageThumb!,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator
                                            .adaptive(),
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
                                widget.args[index].product!.productName!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: kPrimaryColor,
                                ),
                                maxLines: 2,
                              ),
                              Text(
                                NumberFormat.simpleCurrency(
                                        locale: 'vi-VN', decimalDigits: 0)
                                    .format(widget.args[index].product!.price!),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                              Text.rich(TextSpan(
                                text:
                                    "Số lượng: ${widget.args[index].quantity}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    widget.args[index].isReviewed!
                        ? const SizedBox()
                        : RowReviewCustom(
                            orderId: widget.orderId, args: widget.args[index]),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ))),
      ),
    );
  }
}
