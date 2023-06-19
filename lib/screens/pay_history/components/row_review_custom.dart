import 'package:ecommerce_app/models/order_detail_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../api/order/fetch_api_service.dart';
import '../../../configs/constant.dart';
import '../../../controller/login_account_info_controller.dart';
import '../../../controller/order_controller.dart';
import '../../../widget/show_loading_tabbar.dart';
import '../../../widget/show_review_status.dart';

class RowReviewCustom extends StatefulWidget {
  const RowReviewCustom({
    super.key,
    required this.orderId,
    required this.args,
  });
  final OrderDetails args;
  final String orderId;

  @override
  State<RowReviewCustom> createState() => _RowReviewCustomState();
}

class _RowReviewCustomState extends State<RowReviewCustom> {
  late OrderDetails orderDetail;
  String comment = "";
  int rate = 5;
  bool isreview = false;
  @override
  void initState() {
    orderDetail = widget.args;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild review ');
    if (orderDetail.isReviewed! == true || isreview == true) {
      return const SizedBox();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bạn hãy đánh giá sản phẩm trước'),
                Text('24-03-2021 nhé'),
                Text(
                  'Đánh giá ngay',
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  context: context,
                  builder: (context) => SizedBox(
                        height: Get.height * 0.9,
                        child: Column(children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 8,
                            width: 80,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
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
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
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
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2),
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
                              onPressed: () {
                                showLoadingAnimationTabbar(context);

                                setState(() {
                                  orderDetail.isReviewed = true;
                                  isreview = true;
                                });
                                final user =
                                    Get.find<LoginAccountInfoController>();
                                final res = FetchApiOrderService.instance
                                    .createReview(
                                        comment: comment,
                                        rating: rate,
                                        userId: user.user!.id!,
                                        productId:
                                            orderDetail.product!.productId!,
                                        orderId: widget.orderId);
                                final controller = Get.find<OrderController>();
                                controller.loadListOrder(user.user!.id!);

                                Get.back();
                                Get.to(() => const ShowReviewStatus(),
                                    opaque: false);
                              },
                              child: const Text(
                                'Gửi đánh giá',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ]),
                      ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              height: 46,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: kPrimaryColor),
              child: const Center(
                  child: Text(
                'Đánh giá',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      );
    }
  }
}
