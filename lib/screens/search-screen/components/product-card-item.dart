import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../configs/constant.dart';
import '../../../models/product.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.product,
    required this.press,
  });
  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: kSecondaryColor.withOpacity(0.3))),
                child: Image.asset(
                  product.images.first,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            product.title,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(
            children: [
              Text(
                product.rating.toString(),
                style: const TextStyle(fontSize: 13),
              ),
              RatingBar.builder(
                ignoreGestures: true,
                itemSize: 14,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                initialRating: product.rating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                onRatingUpdate: (value) {},
              )
            ],
          ),
          Text(
            '₫${product.price.toString()}',
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
