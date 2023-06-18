import 'package:ecommerce_app/widget/show_review_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../configs/constant.dart';

class RatingBottomSheet extends StatelessWidget {
  const RatingBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          initialRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2),
          onRatingUpdate: (value) {},
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
            onChanged: (value) {},
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
              Get.back();
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
