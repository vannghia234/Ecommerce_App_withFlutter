import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../configs/constant.dart';
import '../../../models/product_list_response.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.width = 150,
    this.aspectRatio = 1.02,
    this.press,
  });
  final double width, aspectRatio;
  final GestureTapCallback? press;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: aspectRatio,
                  child: Container(
                      // padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: kSecondaryColor.withOpacity(0.3),
                            width: 0.2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                          )
                        ],
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: product.urlImageThumb!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator.adaptive(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ))),
              const SizedBox(
                height: 5,
              ),
              Text(
                product.productName!,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    NumberFormat.simpleCurrency(
                            locale: 'vi-VN', decimalDigits: 0)
                        .format(product.price),
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  // InkWell(
                  //   borderRadius: BorderRadius.circular(12),
                  //   onTap: () {
                  //     setState(() {
                  //       // widget.product.isFavourite = !widget.product.isFavourite;
                  //     });
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.all(8),
                  //     width: 28,
                  //     height: 28,
                  //     decoration: BoxDecoration(
                  //         color: widget.product.isFavourite!
                  //             ? kPrimaryColor.withOpacity(0.15)
                  //             : kSecondaryColor.withOpacity(0.1),
                  //         shape: BoxShape.circle),
                  //     child: SvgPicture.asset(
                  //       'assets/icons/Heart Icon_2.svg',
                  //       color: widget.product.isFavourite!
                  //           ? const Color(0xffFF4848)
                  //           : const Color(0xffDBDEE4),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
