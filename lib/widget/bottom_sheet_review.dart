import 'package:ecommerce_app/api/order/fetch_api_service.dart';
import 'package:ecommerce_app/controller/login_account_info_controller.dart';
import 'package:ecommerce_app/controller/order_controller.dart';
import 'package:ecommerce_app/models/order_detail_response.dart';
import 'package:ecommerce_app/widget/show_loading_tabbar.dart';
import 'package:ecommerce_app/widget/show_review_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../configs/constant.dart';

class RatingBottomSheet extends StatelessWidget {
  const RatingBottomSheet({
    super.key,
    required this.orderId,
    required this.args,
  });
  final String orderId;
  final OrderDetails args;

  @override
  Widget build(BuildContext context) {
    String comment = "";
    int rate = 5;
    return SizedBox(
      height: Get.height * 0.9,
      child: Column(children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 8,
          width: 80,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.grey),
        ),
        const SizedBox(
          height: 20,
        ),
        const Spacer(),
        const Text(
          'Mời bạn đánh giá độ hài lòng của bạn\nvề sản phẩm',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),
        RatingBar.builder(
          itemSize: 50,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          initialRating: rate.toDouble(),
          direction: Axis.horizontal,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2),
          onRatingUpdate: (value) {
            rate = value.toInt();
          },
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Vui lòng chia sẻ ý kiến của bạn về sản phẩm\ncủa chúng tôi',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.black,
            autocorrect: true,
            onChanged: (value) {
              comment = value;
            },
            minLines: 6,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
                hintText: 'Hãy giúp chúng tôi hiểu hơn...'),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Spacer(),
        SizedBox(
          width: Get.width,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              backgroundColor: kPrimaryColor,
            ),
            onPressed: () async {
              final user = Get.find<LoginAccountInfoController>();
              final res = FetchApiOrderService.instance.createReview(
                  comment: comment,
                  rating: rate,
                  userId: user.user!.id!,
                  productId: args.product!.productId!,
                  orderId: orderId);
              final controller = Get.find<OrderController>();
              showLoadingAnimationTabbar(context);
              await controller.loadListOrder(user.user!.id!);
              Get.to(() => const ShowReviewStatus(), opaque: false);
            },
            child: const Text(
              'Gửi đánh giá',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
