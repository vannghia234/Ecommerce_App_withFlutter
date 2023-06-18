import 'package:ecommerce_app/models/order_detail_response.dart';
import 'package:flutter/material.dart';

import '../../../configs/constant.dart';
import '../../../widget/bottom_sheet_review.dart';

class RowReviewCustom extends StatelessWidget {
  const RowReviewCustom({
    super.key,
    required this.orderId,
    required this.args,
  });
  final OrderDetails args;
  final String orderId;

  @override
  Widget build(BuildContext context) {
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
              builder: (context) =>
                  RatingBottomSheet(orderId: orderId, args: args),
              // builder: (context) => const RatingBottomSheet(),
              // builder: (context) => Navigator(
              //   initialRoute: '/',
              //   onGenerateRoute: (settings) {
              //     WidgetBuilder builder;
              //     switch (settings.name) {
              //       case '/':
              //         builder = (BuildContext context) =>
              //             const RatingBottomSheet();
              //         break;
              //       case '/second':
              //         builder = (BuildContext context) =>
              //             const SecondPage();
              //         break;
              //       default:
              //         throw Exception(
              //             'Invalid route: ${settings.name}');
              //     }
              //     return MaterialPageRoute(
              //         builder: builder,
              //         settings: settings);
              //   },
              // ),
            );
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
        )
      ],
    );
  }
}
